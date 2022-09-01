package; //this is the new, better, sexier shaders. haha its just a copy of the Shaders.hx

// STOLEN FROM HAXEFLIXEL DEMO AND FROM PSYCH ENGINE 0.5.1 WITH SHADERS LOL
import flixel.system.FlxAssets.FlxShader;
import openfl.display.BitmapData;
import openfl.display.Shader;
import openfl.display.ShaderInput;
import openfl.utils.Assets;
import flixel.FlxG;
import openfl.Lib;
using StringTools;
typedef ShaderEffectt = {
  var shader:Dynamic;
}

class BuildingEffectt {
  public var shader:BuildingShaderr = new BuildingShaderr();
  public function new(){
    shader.alphaShit.value = [0];
  }
  public function addAlpha(alpha:Float){
    trace(shader.alphaShit.value[0]);
    shader.alphaShit.value[0]+=alpha;
  }
  public function setAlpha(alpha:Float){
    shader.alphaShit.value[0]=alpha;
  }
}

class BuildingShaderr extends FlxShader
{
  @:glFragmentSource('
    #pragma header
    uniform float alphaShit;
    void main()
    {

      vec4 color = flixel_texture2D(bitmap,openfl_TextureCoordv);
      if (color.a > 0.0)
        color-=alphaShit;

      gl_FragColor = color;
    }
  ')
  public function new()
  {
    super();
  }
}

class CrtEffect extends Effectt
{
    public var shader:CrtShader;
    public var curved(default, set):Bool = true;

    public function new() {
        shader = new CrtShader();
        shader.curved.value = [true];
        shader.uTime.value = [0.0];
    }

    public function update(elapsed:Float) {
        shader.uTime.value[0] += elapsed;
    }

    public function getFilter():ShaderFilter {
     return new ShaderFilter(shader);
    }

	public function set_curved(value:Bool):Bool {
	curved = value;
        shader.curved.value = [value];
        return value;
	}
}

class CrtShader extends FlxShader {
    @:glFragmentSource('
    #pragma header

    uniform float uTime;
    uniform bool curved;

    vec2 curve(vec2 uv)
    {
	    return uv;
    }

    void main()
    {
        vec2 uv = openfl_TextureCoordv.xy;

        // Curve
        if (curved)
	        uv = curve( uv );

        float daAlp = flixel_texture2D(bitmap,uv).a;
    
        vec3 col;

        // Chromatic
        col.r = flixel_texture2D(bitmap,vec2(uv.x+0.003,uv.y)).x;
        col.g = flixel_texture2D(bitmap,vec2(uv.x+0.000,uv.y)).y;
        col.b = flixel_texture2D(bitmap,vec2(uv.x-0.003,uv.y)).z;

        col *= step(0.0, uv.x) * step(0.0, uv.y);
        col *= 1.0 - step(1.0, uv.x) * 1.0 - step(1.0, uv.y);

        col *= 0.5 + 0.5*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y);
        col *= vec3(0.95,1.05,0.95);

        col *= 0.9+0.1*sin(10.0*uTime+uv.y*700.0);

        col *= 0.99+0.01*sin(110.0*uTime);

        gl_FragColor = vec4(col,daAlp);
    }
    ')
    public function new() {
        super();
    }
}

class Effectt {
	public function setValue(shader:FlxShader, variable:String, value:Float){
		Reflect.setProperty(Reflect.getProperty(shader, 'variable'), 'value', [value]);
	}	
}
