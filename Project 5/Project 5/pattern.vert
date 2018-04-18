#version 330 compatibility
uniform float uTime ;
uniform bool vertex;
out vec2 vST; // texture coords
out vec3 vN; // normal vector
out vec3 vL; // vector from point to light
out vec3 vE; // vector from point to eye
vec3 LightPosition = vec3( 5., 5., 0. );

const float PI = 	3.14159265;
const float AMP = 	0.2;		// amplitude
const float W = 	0.5;		// frequency

void
main( )
{
	vST = gl_MultiTexCoord0.st;
	vec3 vert = gl_Vertex.xyz;
	
	if(vertex==true){
		vert.x = vert.x-0.5*sin(PI*AMP*uTime)*vert.x;
		vert.y = vert.y-0.5*cos(PI*AMP*uTime)*vert.y;
		vert.z = vert.z-0.5*sin(PI*AMP*uTime)*vert.z;
	}

	gl_Position = gl_ModelViewProjectionMatrix * vec4( vert, 1. ); 
}