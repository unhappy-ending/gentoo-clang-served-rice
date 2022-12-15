/*

	CRT - Guest - Advanced (Copyright (C) 2018-2021 guest(r) - guest.r@gmail.com)

	Incorporates many good ideas and suggestions from Dr. Venom.

	I would also like give thanks to many Libretro forums members for continuous feedbacks, suggestions and caring about the shader.

	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

	This program is distributed in the hopes that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

	You should have received a copy of the GNU General Public License along with this program; if not,
	write to the Free Software Foundation, Inc, 59 Temple Place - STE 330, Boston, MA 02111-1307, USA.

	Ported to ReShade by DevilSingh with some help from guest(r)

*/

uniform float ResolutionX <
	ui_label = "Resolution X";
> = 320.0;

uniform float ResolutionY <
	ui_label = "Resolution Y";
> = 240.0;

uniform float lsmooth <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Raster Bloom Effect Smoothing";
> = 0.7;

uniform float GAMMA_IN <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 5.0;
	ui_step = 0.05;
	ui_label = "Gamma Input";
> = 2.4;

uniform float inter <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 800.0;
	ui_step = 25.0;
	ui_label = "Interlace Trigger Resolution";
> = 350.0;

uniform float interm <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 5.0;
	ui_step = 1.0;
	ui_label = "Interlace Mode: OFF, Normal 1-3, Interpolation 4-5";
> = 1.0;

uniform float inters <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.5;
	ui_step = 0.05;
	ui_label = "Interlacing Effect Smoothness";
> = 0.0;

uniform float iscan <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Interlacing Scanline Effect";
> = 0.2;

uniform float prescalex <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "Prescale-X Factor (For xBR...Pre-Shader)";
> = 1.0;

uniform float SIZEH <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Horizontal Glow Radius";
> = 6.0;

uniform float SIGMA_H <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 15.0;
	ui_step = 0.1;
	ui_label = "Horizontal Glow Sigma";
> = 1.2;

uniform float SIZEV <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Vertical Glow Radius";
> = 6.0;

uniform float SIGMA_V <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 15.0;
	ui_step = 0.1;
	ui_label = "Vertical Glow Sigma";
> = 1.2;

uniform float SIZEX <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Horizontal Bloom/Halation/(Glow) Radius";
> = 4.0;

uniform float SIGMA_X <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 15.0;
	ui_step = 0.05;
	ui_label = "Horizontal Bloom/Halation/(Glow) Sigma";
> = 0.7;

uniform float SIZEY <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Vertical Bloom/Halation/(Glow) Radius";
> = 4.0;

uniform float SIGMA_Y <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 15.0;
	ui_step = 0.05;
	ui_label = "Vertical Bloom/Halation/(Glow) Sigma";
> = 0.7;

uniform float glow <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.01;
	ui_label = "Glow Strength";
> = 0.08;

uniform float bloom <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.01;
	ui_label = "Bloom Strength";
> = 0.0;

uniform float halation <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Halation Strength";
> = 0.0;

uniform float gamma_c <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 2.0;
	ui_step = 0.02;
	ui_label = "Gamma Correct";
> = 1.0;

uniform float brightboost1 <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 10.0;
	ui_step = 0.05;
	ui_label = "Bright Boost Dark Pixels";
> = 1.4;

uniform float brightboost2 <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 3.0;
	ui_step = 0.05;
	ui_label = "Bright Boost Bright Pixels";
> = 1.1;

uniform float gsl <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Scanline Type";
> = 0.0;

uniform float scanline1 <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 20.0;
	ui_step = 0.5;
	ui_label = "Scanline Beam Shape Center";
> = 6.0;

uniform float scanline2 <
	ui_type = "drag";
	ui_min = 3.0;
	ui_max = 40.0;
	ui_step = 1.0;
	ui_label = "Scanline Beam Shape Edges";
> = 8.0;

uniform float beam_min <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 3.5;
	ui_step = 0.05;
	ui_label = "Scanline Shape Dark Pixels";
> = 1.3;

uniform float beam_max <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 2.5;
	ui_step = 0.05;
	ui_label = "Scanline Shape Bright Pixels";
> = 1.0;

uniform float beam_size <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Increased Bright Scanline Beam";
> = 0.6;

uniform float vertmask <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.1;
	ui_label = "Scanline Color Deconvergence";
> = 0.0;

uniform float scans <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Scanline Saturation";
> = 0.6;

uniform float spike <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.1;
	ui_label = "Scanline Spike Removal";
> = 1.0;

uniform float h_sharp <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 15.0;
	ui_step = 0.2;
	ui_label = "Horizontal Sharpness";
> = 5.2;

uniform float s_sharp <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.5;
	ui_step = 0.1;
	ui_label = "Substractive Sharpness (1.0 Recommended)";
> = 0.5;

uniform float smart_ei <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 20.0;
	ui_step = 0.25;
	ui_label = "Smart Edges Effect Strength";
> = 0.0;

uniform float ei_limit <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 12.0;
	ui_step = 0.1;
	ui_label = "Smart Edges Effect Strength Limit";
> = 2.0;

uniform float sth <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Smart Edges Smoothing Threshold";
> = 0.2;

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
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "Integer Scaling: Odd:Y, Even:'X'+Y";
> = 0.0;

uniform float OS <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Raster Bloom Overscan Mode";
> = 1.0;

uniform float BLOOM <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 20.0;
	ui_step = 1.0;
	ui_label = "Raster Bloom %";
> = 0.0;

uniform float csize <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.25;
	ui_step = 0.01;
	ui_label = "Corner Size";
> = 0.0;

uniform float bsize <
	ui_type = "drag";
	ui_min = 100.0;
	ui_max = 700.0;
	ui_step = 10.0;
	ui_label = "Border Smoothness";
> = 700.0;

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

uniform float overscanY <
	ui_type = "drag";
	ui_min = -50.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Overscan Y Original Pixels";
> = 0.0;

uniform float shadowMask <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 8.0;
	ui_step = 1.0;
	ui_label = "CRT Mask: 0:CGWG, 1-4:Lottes, 5-7:'Trinitron'";
> = 0.0;

uniform float cgwg <
	ui_type = "drag";
	ui_min = -0.5;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Mask Strength (0, 5-8)";
> = 0.3;

uniform float masksize <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "CRT Mask Size (2.0 Is Nice In 4K)";
> = 1.0;

uniform float maskDark <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Lottes Mask Dark";
> = 0.5;

uniform float maskLight <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Lottes Mask Bright";
> = 1.5;

uniform float mcut <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Mask 5-7 Low Strength";
> = 1.1;

uniform float mask_gamma <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 5.0;
	ui_step = 0.05;
	ui_label = "Mask Gamma";
> = 2.4;

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
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "Slot Mask Size";
> = 1.0;

uniform float mclip <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Keep Mask Effect With Clipping";
> = 0.5;

uniform float GAMMA_OUT <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 3.5;
	ui_step = 0.05;
	ui_label = "Gamma Output";
> = 2.4;

uniform float deconrx <
	ui_type = "drag";
	ui_min = -7.0;
	ui_max = 7.0;
	ui_step = 0.5;
	ui_label = "Horizontal Deconvergence Red Range";
> = 0.0;

uniform float decongx <
	ui_type = "drag";
	ui_min = -7.0;
	ui_max = 7.0;
	ui_step = 0.5;
	ui_label = "Horizontal Deconvergence Green Range";
> = 0.0;

uniform float deconbx <
	ui_type = "drag";
	ui_min = -7.0;
	ui_max = 7.0;
	ui_step = 0.5;
	ui_label = "Horizontal Deconvergence Blue Range";
> = 0.0;

uniform float deconry <
	ui_type = "drag";
	ui_min = -7.0;
	ui_max = 7.0;
	ui_step = 0.5;
	ui_label = "Vertical Deconvergence Red Range";
> = 0.0;

uniform float decongy <
	ui_type = "drag";
	ui_min = -7.0;
	ui_max = 7.0;
	ui_step = 0.5;
	ui_label = "Vertical Deconvergence Green Range";
> = 0.0;

uniform float deconby <
	ui_type = "drag";
	ui_min = -7.0;
	ui_max = 7.0;
	ui_step = 0.5;
	ui_label = "Vertical Deconvergence Blue Range";
> = 0.0;

uniform float decons <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Deconvergence Strength";
> = 0.5;

uniform float deconsmooth <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.25;
	ui_label = "Deconvergence Smoothing";
> = 0.0;

uniform float addnoise <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Add Noise";
> = 0.0;

#include "ReShade.fxh"

#define TexSize float2(ResolutionX,ResolutionY)
#define IptSize float2(ResolutionX,ResolutionY)
#define OptSize float4(BUFFER_SCREEN_SIZE,1.0/BUFFER_SCREEN_SIZE)
#define SrcSize float4(TexSize,1.0/TexSize)
#define FragCoord (texcoord*OptSize.xy)
#define fmod(x,y) (x-y*trunc(x/y))
#define eps 1e-10
#define invsqrsigma_h 1.0/(2.0*SIGMA_H*SIGMA_H)
#define invsqrsigma_v 1.0/(2.0*SIGMA_V*SIGMA_V)
#define invsqrsigma_x 1.0/(2.0*SIGMA_X*SIGMA_X)
#define invsqrsigma_y 1.0/(2.0*SIGMA_Y*SIGMA_Y)

#ifndef Texture_Res_X
#define Texture_Res_X 320
#endif

#ifndef Texture_Res_Y
#define Texture_Res_Y 240
#endif

texture TextureA{Width=Texture_Res_X;Height=Texture_Res_Y;Format=RGBA16F;};
sampler SamplerA{Texture=TextureA;MinFilter=Linear;MagFilter=Linear;};

texture TextureB{Width=Texture_Res_X;Height=Texture_Res_Y;Format=RGBA16F;};
sampler SamplerB{Texture=TextureB;MinFilter=Linear;MagFilter=Linear;};

texture TextureC{Width=Texture_Res_X;Height=Texture_Res_Y;Format=RGBA16F;};
sampler SamplerC{Texture=TextureC;MinFilter=Linear;MagFilter=Linear;};

texture TextureD{Width=Texture_Res_X;Height=Texture_Res_Y;Format=RGBA16F;};
sampler SamplerD{Texture=TextureD;MinFilter=Linear;MagFilter=Linear;};

texture TextureE{Width=Texture_Res_X;Height=Texture_Res_Y;Format=RGBA16F;};
sampler SamplerE{Texture=TextureE;MinFilter=Linear;MagFilter=Linear;};

texture TextureF{Width=Texture_Res_X;Height=Texture_Res_Y;Format=RGBA16F;};
sampler SamplerF{Texture=TextureF;MinFilter=Linear;MagFilter=Linear;};

sampler Sampler0{Texture=ReShade::BackBufferTex;};

uniform int framecount<source="framecount";>;

float sw0(float x,float color,float scanline)
{
	float tmp=lerp(beam_min,beam_max,color);
	float ex=x*tmp;
	ex=(gsl>-0.5)?ex*ex:lerp(ex*ex,ex*ex*ex,0.4);

	return exp2(-scanline*ex);
}

float sw1(float x,float color,float scanline)
{
	float tmp=lerp(1.2*beam_min,beam_max,color);
	x=lerp(x,beam_min*x,max(x-0.4*color,0.0));
	float ex=x*tmp;

	return exp2(-scanline*ex*ex);
}

float sw2(float x,float color,float scanline)
{
	float tmp=lerp(2.5*beam_min,beam_max,color);
	tmp=lerp(beam_max,tmp,pow(x,color+0.3));
	float ex=x*tmp;

	return exp2(-scanline*ex*ex);
}

float sst(float x)
{
	return exp2(-10.0*x*x);
}

float3 mask1(float2 pos,float m)
{
	pos=floor(pos/masksize);
	float3 msk=maskDark;
	float3 one=1.0;
	float drk=lerp(max(clamp(lerp(mcut,cgwg,m),0.0,1.0)-0.3,0.0)+1.0,1.0,m);
	float mcc=1.0-max(cgwg,0.0);

	if(shadowMask==-1.0)
	{
	msk=1.0;
	}
	else

	if(shadowMask==0.0)
	{
	pos.x=frac(pos.x*0.5);
	if(pos.x<0.5)
	{
	msk.r=1.0;
	msk.g=mcc;
	msk.b=1.0;
	}
	else
	{
	msk.r=mcc;
	msk.g=1.0;
	msk.b=mcc;
	}
	}
	else

	if(shadowMask==1.0)
	{
	float lne=maskLight;
	float odd=0.0;

	if(frac(pos.x/6.0)<0.5)
	odd=1.0;
	if(frac((pos.y+odd)/2.0)<0.5)
	lne=maskDark;

	pos.x=frac(pos.x/3.0);

	if(pos.x<0.333)
	msk.r=maskLight;else
	if(pos.x<0.666)
	msk.g=maskLight;else
	msk.b=maskLight;

	msk*=lne;
	}
	else

	if(shadowMask==2.0)
	{
	pos.x=frac(pos.x/3.0);

	if(pos.x<0.333)
	msk.r=maskLight;else
	if(pos.x<0.666)
	msk.g=maskLight;else
	msk.b=maskLight;
	}
	else

	if(shadowMask==3.0)
	{
	pos.x+=pos.y*3.0;
	pos.x=frac(pos.x/6.0);

	if(pos.x<0.333)
	msk.r=maskLight;else
	if(pos.x<0.666)
	msk.g=maskLight;else
	msk.b=maskLight;
	}
	else

	if(shadowMask==4.0)
	{
	pos.xy=floor(pos.xy*float2(1.0,0.5));
	pos.x+=pos.y*3.0;
	pos.x=frac(pos.x/6.0);

	if(pos.x<0.333)
	msk.r=maskLight;else
	if(pos.x<0.666)
	msk.g=maskLight;else
	msk.b=maskLight;
	}
	else

	if(shadowMask==5.0)
	{
	msk=0.0;
	pos.x=frac(pos.x/2.0);
	if(pos.x<0.5)
	{
	msk.r=1.0;
	msk.b=1.0;}else
	msk.g=1.0;
	msk=clamp(lerp(lerp(one,msk,mcut),lerp(one,msk,cgwg),m),0.0,1.0)*drk;
	}
	else

	if(shadowMask==6.0)
	{
	msk=0.0;
	pos.x=frac(pos.x/3.0);
	if(pos.x<0.333)
	msk.r=1.0;else
	if(pos.x<0.666)
	msk.g=1.0;else
	msk.b=1.0;
	msk=clamp(lerp(lerp(one,msk,mcut),lerp(one,msk,cgwg),m),0.0,1.0)*drk;
	}
	else

	if(shadowMask==7.0)
	{
	float maskTmp=clamp(lerp(lerp(1.0,0.0,mcut),lerp(1.0,0.0,cgwg),m),0.0,1.0)*drk;
	msk=maskTmp;
	pos.x=frac(pos.x/2.0);
	if(pos.x<0.5)
	msk=1.0;
	}
	else

	if(shadowMask==8.0)
	{
	msk=mcc;
	pos.x=frac(pos.x*0.25);
	if(pos.x<0.2)
	msk.r=1.0;else
	if(pos.x<0.4)
	msk.rg=1.0.xx;else
	if(pos.x<0.7)
	msk.gb=1.0.xx;else
	msk.b=1.0;	
	}

	return msk;
}

float mask2(float2 pos,float m)
{
	if(slotmask==0.0)return 1.0;

	pos=floor(pos/slotms);
	float mlen=slotwidth*2.0;
	float px=frac(pos.x/mlen);
	float py=floor(frac(pos.y/(2.0*double_slot))*2.0*double_slot);
	float slot_dark=1.0-slotmask*(1.0-0.125*m);
	float slot=1.0;
	if(py==0.0&&px<0.5)slot=slot_dark;else
	if(py==double_slot&&px>=0.5)slot=slot_dark;

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
	coord=(coord-0.5)*1.0+0.5;
	coord=min(coord,1.0-coord)*float2(1.0,OptSize.y/OptSize.x);
	float2 cdist=max(csize/3.0,max((1.0-smoothstep(100.0,600.0,bsize))*0.01,0.002));
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

float3 gc(float3 c)
{
	float mc=max(max(c.r,c.g),c.b);
	float mg=pow(mc,1.0/gamma_c);

	return c*mg/(mc+eps);
}

float3 plant(float3 t,float r)
{
	float tt=max(max(t.r,t.g),t.b)+0.00001;

	return t*r/tt;
}

float dist(float3 A,float3 B)
{
	float r=0.5*(A.r+B.r);
	float3 d=A-B;
	float3 c=float3(2.0+r,4.0,3.0-r);

	return sqrt(dot(c*d,d))/3.0;
}

float gaussh(float x)
{
	return exp(-x*x*invsqrsigma_h);
}

float gaussv(float x)
{
	return exp(-x*x*invsqrsigma_v);
}

float gaussx(float x)
{
	return exp(-x*x*invsqrsigma_x);
}

float gaussy(float x)
{
	return exp(-x*x*invsqrsigma_y);
}

float3 noise(float3 v)
{
	if(addnoise<0.0){v.z=-addnoise;}else{v.z=v.z/6000.0;}
	v=frac(v)+frac(v*1e4)+frac(v*1e-4);
	v+=float3(0.12345,0.6789,0.314159);
	v=frac(v*dot(v,v)*123.456);
	v=frac(v*dot(v,v)*123.456);

	return v;
}

float4 LuminancePS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float m=max(log2(SrcSize.x),log2(SrcSize.y));
	m=max(m-1.0,1.0);

	float2 dx=float2(1.0/SrcSize.x,0.0);
	float2 dy=float2(0.0,1.0/SrcSize.y);
	float2 y2=2.0*dy;
	float2 x2=2.0*dx;

	float ltotal=0.0;

	ltotal+=max(0.0,length(tex2Dlod(Sampler0,float4(0.25,m,0.0,0.0)).rgb));
	ltotal+=max(0.0,length(tex2Dlod(Sampler0,float4(float2(0.25,0.75),m,0.0)).rgb));
	ltotal+=max(0.0,length(tex2Dlod(Sampler0,float4(float2(0.75,0.25),m,0.0)).rgb));
	ltotal+=max(0.0,length(tex2Dlod(Sampler0,float4(0.75,m,0.0,0.0)).rgb));

	ltotal*=0.25;

	ltotal=pow(0.577350269*ltotal,0.65);

	float history=tex2D(SamplerA,0.1).a;

	ltotal=lerp(ltotal,history,lsmooth);

	float3 l1=tex2D(Sampler0,texcoord.xy).rgb;
	float3 r1=tex2D(Sampler0,texcoord.xy+dx).rgb;
	float3 l2=tex2D(Sampler0,texcoord.xy-dx).rgb;
	float3 r2=tex2D(Sampler0,texcoord.xy+x2).rgb;

	float c1=dist(l2,l1);
	float c2=dist(l1,r1);
	float c3=dist(r2,r1);

	return float4(c1,c2,c3,ltotal);
}

float4 LinearizePS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float3 c1=tex2Dlod(Sampler0,float4(texcoord,0.0,0.0)).rgb;
	float3 c2=tex2Dlod(Sampler0,float4(texcoord+float2(0.0,SrcSize.w),0.0,0.0)).rgb;

	float3 c=c1;

	float intera=1.0;
	float gamma_in=clamp(GAMMA_IN,1.0,5.0);

	float m1=max(max(c1.r,c1.g),c1.b);
	float m2=max(max(c2.r,c2.g),c2.b);
	float3 df=abs(c1-c2);

	float d=max(max(df.r,df.g),df.b);
	if(interm==2.0)
	d=lerp(0.1*d,10.0*d,step(m1/(m2+0.0001),m2/(m1+0.0001)));

	float r=m1;

	float yres_div=1.0;

	if(inter<SrcSize.y/yres_div&&interm>0.5)
	{
	intera=0.5;
	float liine_no=clamp(floor(fmod(SrcSize.y*texcoord.y,2.0)),0.0,1.0);
	float frame_no=clamp(floor(fmod(float(framecount),2.0)),0.0,1.0);
	float ii=abs(liine_no-frame_no);

	if(interm <3.5)
	{
	r=clamp(max(m1*ii,(1.0-iscan)*min(m1,m2)),0.0,1.0);
	c=plant(lerp(lerp(c1,c2,min(lerp(m1,1.0-m2,min(m1,1.0-m1))/(d+0.00001),1.0)),c1,ii),r);
	if(interm==3.0)
	c=(1.0-0.5*iscan)*lerp(c2,c1,ii);
	intera=0.0;
	}
	if(interm==5.0)
	{
	c=lerp(c2,c1,0.5);intera=0.5;
	}
	}
	c=pow(c,gamma_in);

	if(texcoord.x>0.5){gamma_in=intera;}else{gamma_in=1.0/gamma_in;}

	return float4(c,gamma_in);
}

float4 HGaussianPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float f=frac(SrcSize.x*texcoord.x);
	f=0.5-f;
	float2 tex=floor(SrcSize.xy*texcoord)*SrcSize.zw+0.5*SrcSize.zw;
	float3 color=0.0;
	float2 dx=float2(SrcSize.z,0.0);

	float w;
	float wsum=0.0;
	float3 pixel;
	float n=-SIZEH;

	do
	{
	pixel=tex2Dlod(SamplerB,float4(tex+n*dx,0.0,0.0)).rgb;
	w=gaussh(n+f);
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;

	}while(n<=SIZEH);

	color=color/wsum;

	return float4(color,1.0);
}

float4 VGaussianPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float f=frac(SrcSize.y*texcoord.y);
	f=0.5-f;
	float2 tex=floor(SrcSize.xy*texcoord)*SrcSize.zw+0.5*SrcSize.zw;
	float3 color=0.0;
	float2 dy=float2(0.0,SrcSize.w);

	float w;
	float wsum=0.0;
	float3 pixel;
	float n=-SIZEV;

	do
	{
	pixel=tex2Dlod(SamplerC,float4(tex+n*dy,0.0,0.0)).rgb;
	w=gaussv(n+f);
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;

	}while(n<=SIZEV);

	color=color/wsum;

	return float4(color,1.0);
}

float4 HBlurPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float f=frac(SrcSize.x*texcoord.x);
	f=0.5-f;
	float2 tex=floor(SrcSize.xy*texcoord)*SrcSize.zw+0.5*SrcSize.zw;
	float4 color=0.0;
	float2 dx=float2(SrcSize.z,0.0);

	float w;
	float wsum=0.0;
	float4 pixel;
	float n=-SIZEX;

	do
	{
	pixel=tex2Dlod(SamplerB,float4(tex+n*dx,0.0,0.0));
	w=gaussx(n+f);
	pixel.a=max(max(pixel.r,pixel.g),pixel.b);
	pixel.a*=pixel.a*pixel.a;
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;

	}while(n<=SIZEX);

	color=color/wsum;

	return float4(color.rgb,pow(color.a,0.333333));
}

float4 VBlurPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float f=frac(SrcSize.y*texcoord.y);
	f=0.5-f;
	float2 tex=floor(SrcSize.xy*texcoord)*SrcSize.zw+0.5*SrcSize.zw;
	float4 color=0.0;
	float2 dy=float2(0.0,SrcSize.w);

	float w;
	float wsum=0.0;
	float4 pixel;
	float n=-SIZEY;

	do
	{
	pixel=tex2Dlod(SamplerE,float4(tex+n*dy,0.0,0.0));
	w=gaussy(n+f);
	pixel.a*=pixel.a*pixel.a;
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;

	}while(n<=SIZEY);

	color=color/wsum;

	return float4(color.rgb,pow(color.a,0.175));
}

float4 GuestPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float lum=tex2D(SamplerA,0.1).a;
	float gamma_in=1.0/tex2D(SamplerB,0.25).a;
	float intera=tex2D(SamplerB,float2(0.75,0.25)).a;
	bool interb=(intera<0.75);
	bool notate=(TATE<0.5);

	if(IOS >0.0)
	{
	float2 ofactor=OptSize.xy/SrcSize.xy;
	float2 intfactor=(IOS<2.5)?floor(ofactor):ceil(ofactor);
	float2 diff=ofactor/intfactor;
	float scan=lerp(diff.y,diff.x,TATE);
	texcoord=overscan(texcoord,scan,scan);
	if(IOS==1.0||IOS==3.0)texcoord=lerp(float2(texcoord.x,texcoord.y),float2(texcoord.x,texcoord.y),TATE);
	}

	float factor=1.00+(1.0-0.5*OS)*BLOOM/100.0-lum*BLOOM/100.0;

	texcoord=overscan(texcoord,factor,factor);

	texcoord=overscan(texcoord,1.0,(SrcSize.y-overscanY)/SrcSize.y);

	float2 pos=warp(texcoord);

	bool smarte=(smart_ei>0.0&&notate);

	float2 coffset=0.5;

	float2 ps=SrcSize.zw;
	float2 OGL2Pos=pos*SrcSize.xy-coffset;
	float2 fp=frac(OGL2Pos);

	float2 dx=float2(ps.x,0.0);
	float2 dy=float2(0.0,ps.y);

	float2 x2=2.0*dx;
	float2 y2=2.0*dy;

	float2 offx=dx;
	float2 off2=x2;
	float2 offy=dy;
	float fpx=fp.x;

	if(!notate)
	{
	offx=dy;
	off2=y2;
	offy=dx;
	fpx=fp.y;
	}
	float f=(notate)?fp.y:fp.x;

	float2 pC4=floor(OGL2Pos)*ps+0.5*ps;

	if(interb)pC4.y=pos.y-inters*SrcSize.w;

	float zero=exp2(-h_sharp);
	float sharp1=s_sharp*zero;

	float fdivider=min(prescalex,2.0);

	float wl3=(2.0+fpx)/fdivider;
	float wl2=(1.0+fpx)/fdivider;
	float wl1=(fpx)/fdivider;
	float wr1=(1.0-fpx)/fdivider;
	float wr2=(2.0-fpx)/fdivider;
	float wr3=(3.0-fpx)/fdivider;

	wl3*=wl3;wl3=exp2(-h_sharp*wl3);
	wl2*=wl2;wl2=exp2(-h_sharp*wl2);
	wl1*=wl1;wl1=exp2(-h_sharp*wl1);
	wr1*=wr1;wr1=exp2(-h_sharp*wr1);
	wr2*=wr2;wr2=exp2(-h_sharp*wr2);
	wr3*=wr3;wr3=exp2(-h_sharp*wr3);

	float fp1=1.0-fpx;

	float wnorm=max(wl1,wr1);

	float twl3=max(wl3-sharp1,0.0);
	float twl2=max(wl2-sharp1,lerp(-0.12,0.0,1.0-fp1*fp1));float swl2=max(twl2,0.0);
	float twl1=max(wl1-sharp1,0.0);
	float twr1=max(wr1-sharp1,0.0);
	float twr2=max(wr2-sharp1,lerp(-0.12,0.0,1.0-fpx*fpx));float swr2=max(twr2,0.0);
	float twr3=max(wr3-sharp1,0.0);

	bool sharp=(sharp1>0.0);

	float rwl3,rwl2,rwr2;

	float rwl1=twl1;
	float rwr1=twr1;
	float3 c1,c2;

	if(smarte)
	{
	rwl3=wl3;rwl2=wl2;
	rwl1=wl1;rwr1=wr1;
	rwr2=wr2;
	twl3=0.0;twr3=0.0;
	float3 d=tex2Dlod(SamplerA,float4(pC4+dy+dy,0.0,0.0)).xyz;
	float3 b=tex2D(SamplerA,pC4+offy).xyz;
	float3 a=tex2D(SamplerA,pC4).xyz;
	float3 t=tex2Dlod(SamplerA,float4(pC4-offy,0.0,0.0)).xyz;
	c1=(h_sharp>2.6)?a:min(a,(t+a+b)/3.0);c1=max(c1-sth,0.0);
	c2=(h_sharp>2.6)?b:min(b,(a+b+d)/3.0);c2=max(c2-sth,0.0);
	}

	float wts=1.0/(swl2+rwl1+rwr1+swr2);

	float3 l3,l2,l1,r1,r2,r3,sl2,sl1,sr1,sr2,color1,color2,colmin,colmax;

	l3=tex2D(SamplerB,pC4-off2).rgb;
	l2=tex2D(SamplerB,pC4-offx).rgb;
	l1=tex2D(SamplerB,pC4).rgb;
	r1=tex2D(SamplerB,pC4+offx).rgb;
	r2=tex2D(SamplerB,pC4+off2).rgb;
	r3=tex2D(SamplerB,pC4+offx+off2).rgb;

	sl2=l2*l2*l2;sl2*=sl2;
	sl1=l1*l1*l1;sl1*=sl1;
	sr1=r1*r1*r1;sr1*=sr1;
	sr2=r2*r2*r2;sr2*=sr2;

	colmin=min(min(l1,r1),min(l2,r2));
	colmax=max(max(l1,r1),max(l2,r2));

	if(smarte)
	{
	float pc=min(1.0+smart_ei*c1.y,ei_limit);
	float pl=min(1.0+smart_ei*max(c1.y,c1.x),ei_limit);
	float pr=min(1.0+smart_ei*max(c1.y,c1.z),ei_limit);
	twl1=pow(rwl1,pc);twr1=pow(rwr1,pc);
	twl2=pow(rwl2,pl);twr2=pow(rwr2,pr);
	float wmax=max(twl1,twr1);
	float sharp_ei=s_sharp*pow(zero,pc)/wmax;
	twl2=max(twl2/wmax-sharp_ei,lerp(-0.15,0.0,1.0-fp1*fp1));
	twl1=max(twl1/wmax-sharp_ei,0.0);
	twr1=max(twr1/wmax-sharp_ei,0.0);
	twr2=max(twr2/wmax-sharp_ei,lerp(-0.15,0.0,1.0-fpx*fpx));
	}
	color1=(l3*twl3+l2*twl2+l1*twl1+r1*twr1+r2*twr2+r3*twr3)/(twl3+twl2+twl1+twr1+twr2+twr3);

	if(sharp)color1=clamp(color1,colmin,colmax);


	float3 gtmp=1.0/6.0;
	float3 scolor1=color1;

	scolor1=(sl2*swl2+sl1*rwl1+sr1*rwr1+sr2*swr2)*wts;
	scolor1=pow(scolor1,gtmp);float3 mcolor1=scolor1;
	scolor1=min(lerp(color1,scolor1,spike),1.0);

	float3 scolor2,mcolor2;

	if(interb)pC4.y=pos.y+inters*SrcSize.w;else

	pC4+=offy;

	l3=tex2D(SamplerB,pC4-off2).rgb;
	l2=tex2D(SamplerB,pC4-offx).rgb;
	l1=tex2D(SamplerB,pC4).rgb;
	r1=tex2D(SamplerB,pC4+offx).rgb;
	r2=tex2D(SamplerB,pC4+off2).rgb;
	r3=tex2D(SamplerB,pC4+offx+off2).rgb;

	sl2=l2*l2*l2;sl2*=sl2;
	sl1=l1*l1*l1;sl1*=sl1;
	sr1=r1*r1*r1;sr1*=sr1;
	sr2=r2*r2*r2;sr2*=sr2;

	colmin=min(min(l1,r1),min(l2,r2));
	colmax=max(max(l1,r1),max(l2,r2));

	if(smarte)
	{
	float pc=min(1.0+smart_ei*c2.y,ei_limit);
	float pl=min(1.0+smart_ei*max(c2.y,c2.x),ei_limit);
	float pr=min(1.0+smart_ei*max(c2.y,c2.z),ei_limit);
	twl1=pow(rwl1,pc);twr1=pow(rwr1,pc);
	twl2=pow(rwl2,pl);twr2=pow(rwr2,pr);
	float wmax=max(twl1,twr1);
	float sharp_ei=s_sharp*pow(zero,pc)/wmax;
	twl2=max(twl2/wmax-sharp_ei,lerp(-0.15,0.0,1.0-fp1*fp1));
	twl1=max(twl1/wmax-sharp_ei,0.0);
	twr1=max(twr1/wmax-sharp_ei,0.0);
	twr2=max(twr2/wmax-sharp_ei,lerp(-0.15,0.0,1.0-fpx*fpx));
	}
	color2=(l3*twl3+l2*twl2+l1*twl1+r1*twr1+r2*twr2+r3*twr3)/(twl3+twl2+twl1+twr1+twr2+twr3);
	
	if(sharp)color2=clamp(color2,colmin,colmax);

	scolor2=color2;
	scolor2=(sl2*swl2+sl1*rwl1+sr1*rwr1+sr2*swr2)*wts;
	scolor2=pow(scolor2,gtmp);mcolor2=scolor2;
	scolor2=min(lerp(color2,scolor2,spike),1.0);

	float3 ctmp;float3 mcolor;float w3;float3 color;
	float3 one=1.0;

	if(!interb)
	{
	float shape1=lerp(scanline1,scanline2,f);
	float shape2=lerp(scanline1,scanline2,1.0-f);

	float wt1=sst(f);
	float wt2=sst(1.0-f);

	float3 color00=color1*wt1+color2*wt2;
	float3 scolor0=scolor1*wt1+scolor2*wt2;
	mcolor=(mcolor1*wt1+mcolor2*wt2)/(wt1+wt2);

	ctmp=color00/(wt1+wt2);
	float3 sctmp=scolor0/(wt1+wt2);

	float wf1,wf2;

	float3 cref1=lerp(sctmp,scolor1,beam_size);float creff1=max(max(cref1.r,cref1.g),cref1.b);
	float3 cref2=lerp(sctmp,scolor2,beam_size);float creff2=max(max(cref2.r,cref2.g),cref2.b);

	float f1=f;
	float f2=1.0-f;

	if(gsl <0.5){wf1=sw0(f1,creff1,shape1);wf2=sw0(f2,creff2,shape2);}else
	if(gsl==1.0){wf1=sw1(f1,creff1,shape1);wf2=sw1(f2,creff2,shape2);}else
	if(gsl==2.0){wf1=sw2(f1,creff1,shape1);wf2=sw2(f2,creff2,shape2);}

	if((wf1+wf2)>1.0){float wtmp=1.0/(wf1+wf2);wf1*=wtmp;wf2*=wtmp;}

	float3 w1=wf1;float3 w2=wf2;

	cref1=color1/(max(max(color1.r,color1.g),color1.b)+0.00001);
	cref2=color2/(max(max(color2.r,color2.g),color2.b)+0.00001);

	w1=lerp(w1*lerp(one,cref1*cref1*cref1,scans),w1,wf1);
	w2=lerp(w2*lerp(one,cref2*cref2*cref2,scans),w2,wf2);

	float3 cd1=one;float3 cd2=one;float vm=sqrt(vertmask);

	float v_hi1=1.0+0.3*vm;
	float v_hi2=1.0+0.6*vm;
	float v_low=1.0-vm;

	float ds1=min(pow(2.0*f1+0.01,f2),1.0);
	float ds2=min(pow(2.0*f2+0.01,f1),1.0);

	if(vertmask<0.0)
	{
	cd1=lerp(one,float3(v_hi2,v_low,v_low),ds1);
	cd2=lerp(one,float3(v_low,v_hi1,v_hi1),ds2);
	}
	else
	{
	cd1=lerp(one,float3(v_hi1,v_low,v_hi1),ds1);
	cd2=lerp(one,float3(v_low,v_hi2,v_low),ds2);
	}

	color=gc(color1)*w1*cd1+gc(color2)*w2*cd2;

	color=min(color,1.0);
	w3=wf1+wf2;
	}

	if(interb)
	{
	color=gc(0.5*(color1+color2));
	mcolor=max(max(color.r,color.g),color.b);
	}

	float mx=max(max(mcolor.r,mcolor.g),mcolor.b);
	mx=pow(mx,1.20/gamma_in);

	float3 orig1=color;
	float3 cmask=one;

	float2 maskcoord=FragCoord.yx*1.000001;
	if(notate)maskcoord=maskcoord.yx;

	float smask=mask2(maskcoord,mx);	
	cmask*=mask1(maskcoord,mx);

	color=pow(color,mask_gamma/gamma_in);
	color=color*cmask;
	color=min(color,1.0);
	color=color*smask;
	color=pow(color,gamma_in/mask_gamma);

	cmask=min(cmask*smask,1.0);

	if(interb)ctmp=color;
	float colmx=pow(max(max(ctmp.r,ctmp.g),ctmp.b),1.40/GAMMA_OUT);
	float bb=lerp(brightboost1,brightboost2,colmx);
	if(interb)bb=(abs(intera-0.5)<0.1)?pow(0.80*bb,0.65):pow(bb,0.70);
	color*=bb;

	float3 Glow=tex2D(SamplerD,pos).rgb;
	float3 Bloom=tex2D(SamplerF,pos).rgb;
	float maxb=tex2D(SamplerF,pos).a;

	float3 Bloom1=min(Bloom*(orig1+color),max(0.5*(colmx+orig1-color),0.0));
	color=color+bloom*Bloom1;

	color=min(color,lerp(one,cmask,mclip));
	if(!interb)color=declip(color,pow(w3,0.60));

	Bloom=lerp(0.5*(Bloom+Bloom*Bloom),Bloom*Bloom,colmx);
	color=color+(0.75+maxb)*Bloom*(0.75+0.70*pow(colmx,0.33333))*lerp(1.0,w3,0.5*colmx)*lerp(one,cmask,0.35+0.4*maxb)*halation;

	Glow=lerp(Glow,0.25*color,0.7*colmx);
	color=color+0.5*glow*Glow;

	color=pow(color,1.0/GAMMA_OUT);

	return float4(color,corner(pos));
}

float4 ChromaticPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float3 color=tex2D(Sampler0,texcoord).rgb;
	float3 total=color;

	const float masksizes[10]={2.0,2.0,3.0,3.0,3.0,3.0,2.0,3.0,2.0,4.0};

	if((abs(deconrx)+abs(decongx)+abs(deconbx))>0.25)
	{	
	float steps=masksizes[int(shadowMask)+1]*masksize;
	steps*=(TATE<0.5)?(OptSize.z):(OptSize.w);
	float stepy=(TATE<0.5)?(OptSize.w):(OptSize.z);

	float2 dx=(TATE<0.5)?float2(steps,0.0):float2(0.0,steps);
	float2 dy=(TATE>0.5)?float2(stepy,0.0):float2(0.0,stepy);

	float2 rc=deconrx*dx+deconry*dy;
	float2 gc=decongx*dx+decongy*dy;
	float2 bc=deconbx*dx+deconby*dy;

	dx=(dx+dy)*deconsmooth;

	float r1=tex2D(Sampler0,texcoord+rc).r;
	float g1=tex2D(Sampler0,texcoord+gc).g;
	float b1=tex2D(Sampler0,texcoord+bc).b;

	float r2=tex2D(Sampler0,texcoord+rc-dx).r;
	float g2=tex2D(Sampler0,texcoord+gc-dx).g;
	float b2=tex2D(Sampler0,texcoord+bc-dx).b;

	float r3=tex2D(Sampler0,texcoord+rc+dx).r;
	float g3=tex2D(Sampler0,texcoord+gc+dx).g;
	float b3=tex2D(Sampler0,texcoord+bc+dx).b;

	float3 result1=float3(r1,g1,b1);
	float3 result2=float3(r2,g2,b2);
	float3 result3=float3(r3,g3,b3);

	total=clamp(lerp(color,(result1+result2+result3)/3.0,decons),0.0,1.0);

	float mc=max(max(color.r,color.g),color.b);
	float mr=max(max(total.r,total.g),total.b);
	total=plant(total,clamp(lerp(mc,mr,0.7*mc+0.3),0.5*mc,1.0));
	}

	total=lerp(total,noise(float3(OptSize.xy*texcoord,float(framecount))),0.2*abs(addnoise));

	float corner=tex2D(Sampler0,texcoord).a;

	return float4(total*corner,1.0);
}

technique CRT_Guest_Advanced
{
	pass Luminance
	{
	VertexShader=PostProcessVS;
	PixelShader=LuminancePS;
	RenderTarget=TextureA;
	}

	pass Linearize
	{
	VertexShader=PostProcessVS;
	PixelShader=LinearizePS;
	RenderTarget=TextureB;
	}

	pass GaussianX
	{
	VertexShader=PostProcessVS;
	PixelShader=HGaussianPS;
	RenderTarget=TextureC;
	}

	pass GaussianY
	{
	VertexShader=PostProcessVS;
	PixelShader=VGaussianPS;
	RenderTarget=TextureD;
	}

	pass Blur_Horz
	{
	VertexShader=PostProcessVS;
	PixelShader=HBlurPS;
	RenderTarget=TextureE;
	}

	pass Blur_Vert
	{
	VertexShader=PostProcessVS;
	PixelShader=VBlurPS;
	RenderTarget=TextureF;
	}

	pass Guest_CRT
	{
	VertexShader=PostProcessVS;
	PixelShader=GuestPS;
	}

	pass Chromatic
	{
	VertexShader=PostProcessVS;
	PixelShader=ChromaticPS;
	}
}
