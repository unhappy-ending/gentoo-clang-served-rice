/*

	CRT - Guest - Dr. Venom

	Copyright (C) 2018-2020 guest(r) - guest.r@gmail.com
	Incorporates many good ideas and suggestions from Dr. Venom.

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
	See the GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

	Ported to ReShade by DevilSingh (with help from guest(r))

*/

uniform float ResolutionX <
	ui_label = "Resolution X";
> = 320.0;

uniform float ResolutionY <
	ui_label = "Resolution Y";
> = 240.0;

uniform float TATE <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "TATE Mode";
> = 0.0;

uniform float IOS <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Smart Integer Scaling: 1.0:Y, 2.0:'X'+Y";
> = 0.0;

uniform float OS <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Raster Bloom Overscan Mode";
> = 1.0;

uniform float blm1 <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 20.0;
	ui_step = 1.0;
	ui_label = "Raster Bloom %";
> = 0.0;

uniform float brightboost1 <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 4.0;
	ui_step = 0.05;
	ui_label = "Bright Boost Dark Pixels";
> = 1.4;

uniform float brightboost2 <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 3.0;
	ui_step = 0.05;
	ui_label = "Bright Boost Bright Pixels";
> = 1.1;

uniform float gsl <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Scanline Type";
> = 0.0;

uniform float scanline1 <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 15.0;
	ui_step = 1.0;
	ui_label = "Scanline Beam Shape Low";
> = 6.0;

uniform float scanline2 <
	ui_type = "drag";
	ui_min = 5.0;
	ui_max = 23.0;
	ui_step = 1.0;
	ui_label = "Scanline Beam Shape High";
> = 8.0;

uniform float beam_min <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 2.5;
	ui_step = 0.05;
	ui_label = "Scanline Dark";
> = 1.35;

uniform float beam_max <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Scanline Bright";
> = 1.05;

uniform float beam_size <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Increased Bright Scanline Beam";
> = 0.7;

uniform float spike <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.1;
	ui_label = "Scanline Spike Removal";
> = 1.1;

uniform float h_sharp <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 15.0;
	ui_step = 0.25;
	ui_label = "Horizontal Sharpness";
> = 5.25;

uniform float s_sharp <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.1;
	ui_label = "Substractive Sharpness";
> = 0.4;

uniform float csize <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.07;
	ui_step = 0.01;
	ui_label = "Corner Size";
> = 0.0;

uniform float bsize <
	ui_type = "drag";
	ui_min = 100.0;
	ui_max = 600.0;
	ui_step = 25.0;
	ui_label = "Border Smoothness";
> = 600.0;

uniform float warpX <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.125;
	ui_step = 0.01;
	ui_label = "Curvature X (Default 0.03)";
> = 0.0;

uniform float warpY <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.125;
	ui_step = 0.01;
	ui_label = "Curvature Y (Default 0.04)";
> = 0.0;

uniform float TAPSH <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 10.0;
	ui_step = 1.0;
	ui_label = "Horizontal Glow Radius";
> = 2.0;

uniform float GLOW_FALLOFF_H <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Horizontal Glow Grade";
> = 0.2;

uniform float TAPSV <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 10.0;
	ui_step = 1.0;
	ui_label = "Vertical Glow Radius";
> = 2.0;

uniform float GLOW_FALLOFF_V <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Vertical Glow Grade";
> = 0.2;

uniform float glow <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.5;
	ui_step = 0.01;
	ui_label = "Glow Strength";
> = 0.02;

uniform float shadowMask <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 7.0;
	ui_step = 1.0;
	ui_label = "CRT Mask: 0:CGWG, 1-4:Lottes, 5-6:'Trinitron'";
> = 0.0;

uniform float masksize <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "CRT Mask Size (2.0 is nice in 4K)";
> = 1.0;

uniform float vertmask <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.25;
	ui_step = 0.01;
	ui_label = "PVM Like Colors";
> = 0.0;

uniform float slotmask <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Slot Mask Strength";
> = 0.0;

uniform float slotwidth <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 6.0;
	ui_step = 0.5;
	ui_label = "Slot Mask Width";
> = 2.0;

uniform float double_slot <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Slot Mask Height: 2x1 or 4x1";
> = 1.0;

uniform float slotms <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Slot Mask Size";
> = 1.0;

uniform float mcut <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.5;
	ui_step = 0.05;
	ui_label = "Mask 5-7 Cutoff";
> = 0.2;

uniform float maskDark <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Lottes&Trinitron Mask Dark";
> = 0.5;

uniform float maskLight <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Lottes&Trinitron Mask Bright";
> = 1.5;

uniform float CGWG <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Mask 0&7 Strength";
> = 0.3;

uniform float gamma_in <
	ui_type = "drag";
	ui_min = 0.1;
	ui_max = 5.0;
	ui_step = 0.05;
	ui_label = "Gamma Input";
> = 2.4;

uniform float gamma_out <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 3.5;
	ui_step = 0.05;
	ui_label = "Gamma Output";
> = 2.4;

uniform float inter <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 800.0;
	ui_step = 25.0;
	ui_label = "Interlace Trigger Resolution";
> = 400.0;

uniform float interm <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 3.0;
	ui_step = 1.0;
	ui_label = "Interlace Mode (0.0 = OFF)";
> = 1.0;

uniform float blm2 <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.1;
	ui_label = "Bloom Strength";
> = 0.0;

uniform float scans <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.1;
	ui_label = "Scanline 1&2 Saturation";
> = 0.5;

#include "ReShade.fxh"

#define TextureSize float2(ResolutionX,ResolutionY)
#define InputSize float2(ResolutionX,ResolutionY)
#define OutputSize float4(BUFFER_SCREEN_SIZE,1.0/BUFFER_SCREEN_SIZE)
#define SourceSize float4(TextureSize,1.0/TextureSize)
#define fmod(x,y)(x-y*trunc(x/y))
#define kernel_h(x)exp(-GLOW_FALLOFF_H*(x)*(x))
#define kernel_v(x)exp(-GLOW_FALLOFF_V*(x)*(x))

texture Texture1{Width=BUFFER_WIDTH;Height=BUFFER_HEIGHT;Format=RGBA16F;};
sampler Sampler1{Texture=Texture1;MinFilter=Linear;MagFilter=Linear;};

texture Texture2{Width=BUFFER_WIDTH;Height=BUFFER_HEIGHT;Format=RGBA16F;};
sampler Sampler2{Texture=Texture2;MinFilter=Linear;MagFilter=Linear;};

texture Texture3{Width=BUFFER_WIDTH;Height=BUFFER_HEIGHT;Format=RGBA16F;};
sampler Sampler3{Texture=Texture3;MinFilter=Linear;MagFilter=Linear;};

texture Texture4{Width=BUFFER_WIDTH;Height=BUFFER_HEIGHT;Format=RGBA16F;};
sampler Sampler4{Texture=Texture4;MinFilter=Linear;MagFilter=Linear;};

texture Texture5{Width=BUFFER_WIDTH;Height=BUFFER_HEIGHT;Format=RGBA16F;};
sampler Sampler5{Texture=Texture5;MinFilter=Linear;MagFilter=Linear;};

sampler Sampler0{Texture=ReShade::BackBufferTex;};

uniform int framecount<source="framecount";>;

float st(float x)
{
	return exp2(-10.0*x*x);
}

float3 sw0(float3 x,float3 color,float scanline)
{
	float3 tmp=lerp(beam_min,beam_max,color);
	float3 ex=x*tmp;

	return exp2(-scanline*ex*ex);
}

float3 sw1(float3 x,float3 color,float scanline)
{
	float mx=max(max(color.r,color.g),color.b);
	x=lerp(x,beam_min*x,max(x-0.4*mx,0.0));
	float3 tmp=lerp(1.2*beam_min,beam_max,color);
	float3 ex=x*tmp;
	float br=clamp(0.8*beam_min-1.0,0.2,0.45);
	float3 res=exp2(-scanline*ex*ex)/(1.0-br+br*mx);
	mx=max(max(res.r,res.g),res.b);
	float scans1=scans;if(abs(vertmask)>0.01)scans1=1.0;

	return lerp(mx,res,scans1);
}

float3 sw2(float3 x,float3 color,float scanline)
{
	float mx=max(max(color.r,color.g),color.b);
	float3 tmp=lerp(2.5*beam_min,beam_max,color);
	tmp=lerp(beam_max,tmp,pow(abs(x),color+0.3));
	float3 ex=x*tmp;
	float3 res=exp2(-scanline*ex*ex)/(0.6+0.4*mx);
	mx=max(max(res.r,res.g),res.b);
	float scans1=scans;if(abs(vertmask)>0.01)scans1=0.85;

	return lerp(mx,res,scans1);
}

float3 mask1(float2 pos,float3 c)
{
	pos=floor(pos/masksize);
	float3 mask=maskDark;

	if(shadowMask==-1.0)
	{
		mask=1.0;
	}
	else

	if(shadowMask==0.0)
	{
		pos.x=frac(pos.x*0.5);
		float mc=1.0-CGWG;
		if(pos.x<0.5)
		{mask.r=1.1;mask.g=mc;mask.b=1.1;}else
		{mask.r=mc;mask.g=1.1;mask.b=mc;}
	}
	else

	if(shadowMask==1.0)
	{
		float line1=maskLight;
		float odd=0.0;
		if(frac(pos.x/6.0)<0.5)
		odd=1.0;
		if(frac((pos.y+odd)/2.0)<0.5)
		line1=maskDark;
		pos.x=frac(pos.x/3.0);
		if(pos.x<0.333)
		mask.r=maskLight;else
		if(pos.x<0.666)
		mask.g=maskLight;else
		mask.b=maskLight;
		mask*=line1;
	}
	else

	if(shadowMask==2.0)
	{
		pos.x=frac(pos.x/3.0);
		if(pos.x<0.333)
		mask.r=maskLight;else
		if(pos.x<0.666)
		mask.g=maskLight;else
		mask.b=maskLight;
	}
	else

	if(shadowMask==3.0)
	{
		pos.x+=pos.y*3.0;
		pos.x=frac(pos.x/6.0);
		if(pos.x<0.333)
		mask.r=maskLight;else
		if(pos.x<0.666)
		mask.g=maskLight;else
		mask.b=maskLight;
	}
	else

	if(shadowMask==4.0)
	{
		pos.xy=floor(pos.xy*float2(1.0,0.5));
		pos.x+=pos.y*3.0;
		pos.x=frac(pos.x/6.0);
		if(pos.x<0.333)
		mask.r=maskLight;else
		if(pos.x<0.666)
		mask.g=maskLight;else
		mask.b=maskLight;
	}
	else

	if(shadowMask==5.0)
	{
		float mx=max(max(c.r,c.g),c.b);
		float3 maskTmp=min(1.25*max(mx-mcut,0.0)/(1.0-mcut),maskDark+0.2*(1.0-maskDark)*mx);
		float adj=0.80*maskLight-0.5*(0.80*maskLight-1.0)*mx+0.75*(1.0-mx);
		mask=maskTmp;
		pos.x=frac(pos.x/2.0);
		if(pos.x<0.5){
		mask.r=adj;
		mask.b=adj;}else
		mask.g=adj;
	}
	else

	if(shadowMask==6.0)
	{
		float mx=max(max(c.r,c.g),c.b);
		float3 maskTmp=min(1.33*max(mx-mcut,0.0)/(1.0-mcut),maskDark+0.225*(1.0-maskDark)*mx);
		float adj=0.80*maskLight-0.5*(0.80*maskLight-1.0)*mx+0.75*(1.0-mx);
		mask=maskTmp;
		pos.x=frac(pos.x/3.0);
		if(pos.x<0.333)
		mask.r=adj;else
		if(pos.x<0.666)
		mask.g=adj;else
		mask.b=adj;
	}
	else

	if(shadowMask==7.0)
	{
		float mc=1.0-CGWG;
		float mx=max(max(c.r,c.g),c.b);
		float maskTmp=min(1.6*max(mx-mcut,0.0)/(1.0-mcut),mc);
		mask=float3(maskTmp,maskTmp,maskTmp);
		pos.x=frac(pos.x/2.0);
		if(pos.x<0.5)
		mask=1.0+0.6*(1.0-mx);
	}

	return mask;
}

float mask2(float2 pos,float3 c)
{
	if(slotmask==0.0)
	return 1.0;
	pos=floor(pos/slotms);
	float mx=pow(max(max(c.r,c.g),c.b),1.33);
	float mlen=slotwidth*2.0;
	float px=frac(pos.x/mlen);
	float py=floor(frac(pos.y/(2.0*double_slot))*2.0*double_slot);
	float slot_dark=lerp(1.0-slotmask,1.0-0.80*slotmask,mx);
	float slot=1.0+0.7*slotmask*(1.0-mx);
	if(py==0.0&&px<0.5)
	slot=slot_dark;else
	if(py==double_slot&&px>=0.5)
	slot=slot_dark;

	return slot;
}

float2 warp(float2 pos)
{
	pos=pos*2.0-1.0;
	pos*=float2(1.0+(pos.y*pos.y)*warpX,1.0+(pos.x*pos.x)*warpY);

	return pos*0.5+0.5;
}

float2 overscan(float2 pos,float dx,float dy)
{
	pos=pos*2.0-1.0;
	pos*=float2(dx,dy);

	return pos*0.5+0.5;
}

float corner(float2 coord)
{
	coord*=SourceSize.xy/InputSize.xy;
	coord=(coord-0.5)*1.0+0.5;
	coord=min(coord,1.0-coord)*float2(1.0,OutputSize.y/OutputSize.x);
	float2 cdist=max(csize,max((1.0-smoothstep(100.0,600.0,bsize))*0.01,0.002));
	coord=(cdist-min(coord,cdist));
	float dist=sqrt(dot(coord,coord));

	return clamp((cdist.x-dist)*bsize,0.0,1.0);
}

float3 declip(float3 c,float b)
{
	float m=max(max(c.r,c.g),c.b);
	if(m>b)c=c*b/m;

	return c;
}

float4 LuminancePS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	if(texcoord.x>0.1||texcoord.y>0.1)discard;
	float xtotal=floor(InputSize.x/64.0);
	float ytotal=floor(InputSize.y/64.0);
	float ltotal=0.0;
	float2 dx=float2(SourceSize.z,0.0)*64.0;
	float2 dy=float2(0.0,SourceSize.w)*64.0;
	float2 offset=0.25*(dx+dy);
	for(float i=0.0;i<=xtotal;i++){
	for(float j=0.0;j<=ytotal;j++){
	ltotal+=max(0.15,length(tex2Dlod(Sampler0,float4(i*dx+j*dy+offset,0.0,6.0)).rgb));}}
	ltotal=0.577350269*ltotal/((xtotal+1.0)*(ytotal+1.0));

	return pow(ltotal,0.65);
}

float4 LinearizePS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	return pow(tex2D(Sampler0,texcoord),gamma_in);
}

float4 HBlurPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float3 col=0.0;
	float dx=SourceSize.z;
	float k_total=0.0;
	for(float i=-TAPSH;i<=TAPSH;i++){
    float k=kernel_h(i);
    k_total+=k;
    col+=k*tex2Dlod(Sampler2,float4(texcoord+float2(float(i)*dx,0.0),0.0,0.0)).rgb;}

	return float4(col/k_total,1.0);
}

float4 VBlurPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float3 col=0.0;
	float dy=SourceSize.w;
	float k_total=0.0;
	for(float i=-TAPSV;i<=TAPSV;i++){
    float k=kernel_v(i);
    k_total+=k;
    col+=k*tex2Dlod(Sampler3,float4(texcoord+float2(0.0,float(i)*dy),0.0,0.0)).rgb;}

	return float4(col/k_total,1.0);
}

float4 ScanlinesPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	return float4(pow(tex2D(Sampler0,texcoord).rgb,10.0),1.0);
}

float4 GuestPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float lum=tex2D(Sampler1,0.05).a;

	if(IOS>0.0)
	{
		float2 ofactor=OutputSize.xy/InputSize.xy;
		float2 intfactor=round(ofactor);
		float2 diff=ofactor/intfactor;
		float scan=lerp(diff.y,diff.x,TATE);
		texcoord=overscan(texcoord*(SourceSize.xy/InputSize.xy),scan,scan)*(InputSize.xy/SourceSize.xy);
		if(IOS==1.0)texcoord=lerp(float2(texcoord.x,texcoord.y),float2(texcoord.x,texcoord.y),TATE);
	}

	float factor=1.00+(1.0-0.5*OS)*blm1/100.0-lum*blm1/100.0;
	texcoord=overscan(texcoord*(SourceSize.xy/InputSize.xy),factor,factor)*(InputSize.xy/SourceSize.xy);
	float2 pos=warp(texcoord*(TextureSize.xy/InputSize.xy))*(InputSize.xy/TextureSize.xy);

	float2 coffset=0.5;
	if((interm==1.0||interm==2.0)&&inter<=lerp(InputSize.y,InputSize.x,TATE))coffset=((TATE<0.5)?float2(0.5,0.0):float2(0.0,0.5));

	float2 ps=SourceSize.zw;
	float2 ogl2pos=pos*SourceSize.xy-coffset;
	float2 fp=frac(ogl2pos);
	float2 dx=float2(ps.x,0.0);
	float2 dy=float2(0.0,ps.y);

	float2 x2=2.0*dx;
	float2 y2=2.0*dy;

	float2 offx=dx;
	float2 off2=x2;
	float2 offy=dy;
	float fpx=fp.x;

	if(TATE>0.5)
	{
		offx=dy;
		off2=y2;
		offy=dx;
		fpx=fp.y;
	}

	float f=(TATE<0.5)?fp.y:fp.x;

	float2 pc4=floor(ogl2pos)*ps+0.5*ps;

	float zero=exp2(-h_sharp);
	float sharp1=s_sharp*zero;

	float wl3=2.0+fpx;
	float wl2=1.0+fpx;
	float wl1=fpx;
	float wr1=1.0-fpx;
	float wr2=2.0-fpx;
	float wr3=3.0-fpx;

	wl3*=wl3;wl3=exp2(-h_sharp*wl3);
	wl2*=wl2;wl2=exp2(-h_sharp*wl2);
	wl1*=wl1;wl1=exp2(-h_sharp*wl1);
	wr1*=wr1;wr1=exp2(-h_sharp*wr1);
	wr2*=wr2;wr2=exp2(-h_sharp*wr2);
	wr3*=wr3;wr3=exp2(-h_sharp*wr3);

	float fp1=1.0-fpx;

	float twl3=max(wl3-sharp1,0.0);
	float twl2=max(wl2-sharp1,lerp(0.0,lerp(-0.17,-0.025,fp.x),float(s_sharp>0.05)));
	float twl1=max(wl1-sharp1,0.0);
	float twr1=max(wr1-sharp1,0.0);
	float twr2=max(wr2-sharp1,lerp(0.0,lerp(-0.17,-0.025,1.0-fp.x),float(s_sharp>0.05)));
	float twr3=max(wr3-sharp1,0.0);

	float wtt=1.0/(twl3+twl2+twl1+twr1+twr2+twr3);
	float wt=1.0/(wl2+wl1+wr1+wr2);
	bool sharp=(s_sharp>0.05);

	float3 l3=tex2D(Sampler2,pc4-off2).xyz;
	float3 l2=tex2D(Sampler2,pc4-offx).xyz;
	float3 l1=tex2D(Sampler2,pc4).xyz;
	float3 r1=tex2D(Sampler2,pc4+offx).xyz;
	float3 r2=tex2D(Sampler2,pc4+off2).xyz;
	float3 r3=tex2D(Sampler2,pc4+offx+off2).xyz;

	float3 sl2=tex2D(Sampler5,pc4-offx).xyz;
	float3 sl1=tex2D(Sampler5,pc4).xyz;
	float3 sr1=tex2D(Sampler5,pc4+offx).xyz;
	float3 sr2=tex2D(Sampler5,pc4+off2).xyz;

	float3 color1=(l3*twl3+l2*twl2+l1*twl1+r1*twr1+r2*twr2+r3*twr3)*wtt;

	float3 colmin=min(min(l1,r1),min(l2,r2));
	float3 colmax=max(max(l1,r1),max(l2,r2));

	if(sharp)color1=clamp(color1,colmin,colmax);

	float3 gtmp=gamma_out*0.1;
	float3 scolor1=color1;

	scolor1=(sl2*wl2+sl1*wl1+sr1*wr1+sr2*wr2)*wt;
	scolor1=pow(scolor1,gtmp);float3 mcolor1=scolor1;
	scolor1=lerp(color1,scolor1,spike);

	pc4+=offy;

	l3=tex2D(Sampler2,pc4-off2).xyz;
	l2=tex2D(Sampler2,pc4-offx).xyz;
	l1=tex2D(Sampler2,pc4).xyz;
	r1=tex2D(Sampler2,pc4+offx).xyz;
	r2=tex2D(Sampler2,pc4+off2).xyz;
	r3=tex2D(Sampler2,pc4+offx+off2).xyz;

	sl2=tex2D(Sampler5,pc4-offx).xyz;
	sl1=tex2D(Sampler5,pc4).xyz;
	sr1=tex2D(Sampler5,pc4+offx).xyz;
	sr2=tex2D(Sampler5,pc4+off2).xyz;

	float3 color2=(l3*twl3+l2*twl2+l1*twl1+r1*twr1+r2*twr2+r3*twr3)*wtt;

	colmin=min(min(l1,r1),min(l2,r2));
	colmax=max(max(l1,r1),max(l2,r2));

	if(sharp)color2=clamp(color2,colmin,colmax);

	float3 scolor2=color2;

	scolor2=(sl2*wl2+sl1*wl1+sr1*wr1+sr2*wr2)*wt;
	scolor2=pow(scolor2,gtmp);float3 mcolor2=scolor2;
	scolor2=lerp(color2,scolor2,spike);

	float3 color0=color1;

	if((interm==1.0||interm==2.0)&&inter<=lerp(InputSize.y,InputSize.x,TATE))
	{
		pc4-=2.0*offy;

		l3=tex2D(Sampler2,pc4-off2).xyz;
		l2=tex2D(Sampler2,pc4-offx).xyz;
		l1=tex2D(Sampler2,pc4).xyz;
		r1=tex2D(Sampler2,pc4+offx).xyz;
		r2=tex2D(Sampler2,pc4+off2).xyz;
		r3=tex2D(Sampler2,pc4+offx+off2).xyz;

		color0=(l3*twl3+l2*twl2+l1*twl1+r1*twr1+r2*twr2+r3*twr3)*wtt;

		colmin=min(min(l1,r1),min(l2,r2));
		colmax=max(max(l1,r1),max(l2,r2));

		if(sharp)color0=clamp(color0,colmin,colmax);
	}

	float shape1=lerp(scanline1,scanline2,f);
	float shape2=lerp(scanline1,scanline2,1.0-f);

	float wt1=st(f);
	float wt2=st(1.0-f);

	float3 color00=color1*wt1+color2*wt2;
	float3 scolor0=scolor1*wt1+scolor2*wt2;
	float3 mcolor=(mcolor1*wt1+mcolor2*wt2)/(wt1+wt2);

	float3 ctmp=color00/(wt1+wt2);
	float3 sctmp=scolor0/(wt1+wt2);

	float3 tmp=pow(ctmp,1.0/gamma_out);
	mcolor=clamp(lerp(ctmp,mcolor,1.5),0.0,1.0);
	mcolor=pow(mcolor,1.4/gamma_out);

	float3 w1,w2=0.0;

	float3 cref1=lerp(sctmp,scolor1,beam_size);
	float3 cref2=lerp(sctmp,scolor2,beam_size);

	float3 shift=float3(-vertmask,vertmask,-vertmask);

	float3 f1=clamp(f+shift*0.5*(1.0+f),0.0,1.0);
	float3 f2=clamp((1.0-f)-shift*0.5*(2.0-f),0.0,1.0);

	if(gsl==0.0){w1=sw0(f1,cref1,shape1);w2=sw0(f2,cref2,shape2);}else
	if(gsl==1.0){w1=sw1(f1,cref1,shape1);w2=sw1(f2,cref2,shape2);}else
	if(gsl==2.0){w1=sw2(f1,cref1,shape1);w2=sw2(f2,cref2,shape2);}

	float3 color=color1*w1+color2*w2;
	color=min(color,1.0);

	if(interm>0.5&&inter<=lerp(InputSize.y,InputSize.x,TATE))
	{
		if(interm<3.0)
		{
			float line_no=floor(fmod(lerp(ogl2pos.y,ogl2pos.x,TATE),2.0));
			float frame_no=floor(fmod(float(framecount),2.0));
			float ii=(interm>1.5)?0.5:abs(line_no-frame_no);

			float3 icolor1=lerp(color1,color0,ii);
			float3 icolor2=lerp(color1,color2,ii);

			color=lerp(icolor1,icolor2,f);
		}
		else

		color=lerp(color1,color2,f);
		mcolor=sqrt(color);
	}

	ctmp=0.5*(ctmp+tmp);
	color*=lerp(brightboost1,brightboost2,max(max(ctmp.r,ctmp.g),ctmp.b));

	float3 orig1=color;float pixbr=max(max(ctmp.r,ctmp.g),ctmp.b);float3 orig=ctmp;w1=w1+w2;float w3=max(max(w1.r,w1.g),w1.b);
	float3 cmask=1.0;float3 cmask1=cmask;float3 one=1.0;

	cmask*=(TATE<0.5)?mask1(position.xy*1.000001,mcolor):
	mask1(position.yx*1.000001,mcolor);

	color=color*cmask;

	color=min(color,1.0);

	cmask1*=(TATE<0.5)?mask2(position.xy*1.000001,tmp):
	mask2(position.yx*1.000001,tmp);

	color=color*cmask1;cmask=cmask*cmask1;cmask=min(cmask,1.0);

	float3 Bloom1=tex2D(Sampler4,pos).xyz;

	float3 Bloom2=2.0*Bloom1*Bloom1;
	Bloom2=min(Bloom2,0.80);
	float bmax=max(max(Bloom2.r,Bloom2.g),Bloom2.b);
	float pmax=lerp(0.825,0.725,pixbr);
	Bloom2=min(Bloom2,pmax*bmax)/pmax;

	Bloom2=lerp(min(Bloom2,color),Bloom2,0.5*(orig1+color));

	Bloom2=blm2*Bloom2;

	color=color+Bloom2;

	color=min(color,1.0);
	if(interm<0.5||inter>lerp(InputSize.y,InputSize.x,TATE))color=declip(color,pow(w3,0.5));
	color=min(color,lerp(cmask,one,0.5));

	color=color+glow*Bloom1;

	color=pow(color,1.0/gamma_out);
	return float4(color*corner(pos),1.0);
}

technique GuestCRT
{
	pass Luminance
	{
	VertexShader=PostProcessVS;
	PixelShader=LuminancePS;
	RenderTarget=Texture1;
	}

	pass Linearize_Gamma
	{
	VertexShader=PostProcessVS;
	PixelShader=LinearizePS;
	RenderTarget=Texture2;
	}

	pass Blur_Horz
	{
	VertexShader=PostProcessVS;
	PixelShader=HBlurPS;
	RenderTarget=Texture3;
	}

	pass Blur_Vert
	{
	VertexShader=PostProcessVS;
	PixelShader=VBlurPS;
	RenderTarget=Texture4;
	}

	pass Linearize_Scanlines
	{
	VertexShader=PostProcessVS;
	PixelShader=ScanlinesPS;
	RenderTarget=Texture5;
	}

	pass Guest_Dr_Venom
	{
	VertexShader=PostProcessVS;
	PixelShader=GuestPS;
	}
}
