Shader "My/Sphere"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue" = "Transparent"} // <-- ����

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:fade // <-- ����

        sampler2D _MainTex;
        sampler2D _MainTex2; // <-- ����

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2; // <-- ����
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x, IN.uv_MainTex.y + _Time.y));
            //fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2 - c.r); // <-- ����
            fixed4 d = tex2D (_MainTex2, float2(IN.uv_MainTex2.x, IN.uv_MainTex2.y - _Time.y));
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex + d.r - 0.1);
            
            o.Emission = c.rgb; // <-- ����
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
