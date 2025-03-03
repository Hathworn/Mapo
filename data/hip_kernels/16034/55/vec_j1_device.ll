; ModuleID = '../data/hip_kernels/16034/55/main.cu'
source_filename = "../data/hip_kernels/16034/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__ocmltbl_M64_J1 = internal unnamed_addr addrspace(4) constant [120 x double] [double 0.000000e+00, double 5.000000e-01, double 0xBC37ED0E3B828B08, double 0xBFAFFFFFFFFFFFF5, double 0xBCE0293164FB7EB1, double 0x3F65555555561A43, double 0xBD4677D2FF1A71B8, double 0xBF0C71C715CC6962, double 0xBD855CABD8EBF8FC, double 0x3EA6C1780F921557, double 0xBDA2ED5069AAC6FE, double 0xBE383B4470480845, double 0xBDA01864213FB0F9, double 0x3DC4844C536D3A2C, double 0xBD735A9C5CC3AB06, double 0x3FE29EA3D19F035F, double 0xBC59E62CC35EC1BE, double 0xBFCA41115C5DF242, double 0x3F78D1448E6FEE77, double 0x3F8C441A2F9DDF5D, double 0xBF386671C18BFE53, double 0xBF39E2504DD90DCF, double 0x3EE34CCBCAB07EC9, double 0x3EDA4973743766EE, double 0xBE810453841038E8, double 0xBE70FADE42A46CB3, double 0x3E135494D664AEE3, double 0x3DFE5B866C453F65, double 0xBD9EB2970ACB8068, double 0xBD82FAF08AAFB901, double 0.000000e+00, double 0xBFD9C6CF582CBF7F, double 0x3FAAE8A39F51AD04, double 0x3FAB589D1DA13AA3, double 0xBF7537544C331CD2, double 0xBF624B3409976AC2, double 0x3F26E4C2D52DAE44, double 0x3F083A06E62D9F8F, double 0xBEC9799D369B7229, double 0xBEA338283463A4EE, double 0x3E6170516F7C85EE, double 0x3E34584933FDDD86, double 0xBDF026119D7F08AF, double 0xBDBF9000DA3A4471, double 0x3D5F7332C56D63D2, double 0xBFD626EE83500BF2, double 0xBC40432466D6E3F3, double 0x3FC55F6BEC9EF961, double 0xBF83D23336FD10A9, double 0xBF88C77A983A068D, double 0x3F45CDC98DB18C8C, double 0x3F373576FF44EF39, double 0xBEF24614479A1346, double 0xBED7B85342EA7515, double 0x3E90ABFC294C82A1, double 0x3E6EA79EAB269916, double 0xBE235BBE38F3529C, double 0xBDFB5A33186E7193, double 0x3DAEFC264AA83BF3, double 0x3D8145CBB6E8A3A0, double 0.000000e+00, double 0x3FD33518B3874E8A, double 0xBF95E70DC60362BF, double 0xBFA80C83BDEEE593, double 0x3F69A4B292E3DE28, double 0x3F613FBC7D695936, double 0xBF207358BBDBE512, double 0xBF0796A751A29AC8, double 0x3EC4255B013502CF, double 0x3EA3026DB6F0DBC4, double 0xBE5D48DCA8C5FC90, double 0xBE3445E1DA91DBCA, double 0x3DEC62A36E1968D3, double 0x3DBE721272D8248E, double 0xBD739F923D874246, double 0x3FD17DBF09D40D25, double 0x3C44967F4F7FC629, double 0xBFC1404BF647C28F, double 0x3F74F4DF2769F79D, double 0x3F85C6285429B55E, double 0xBF3D68AB7227E79D, double 0xBF356ACB64517694, double 0x3EEC10B47C6794FC, double 0x3ED67EAAE7C19EC8, double 0xBE8BB65280097FDB, double 0xBE6D871DDEB2DB00, double 0x3E20F432B5F8846E, double 0x3DFA96B19CBA8298, double 0xBDAC2077A86562A4, double 0xBD810893DC905EFB, double 0.000000e+00, double 0xBFCFF654544EBCD0, double 0x3F89223FF2C0785A, double 0x3FA4B0C5D5DA65D1, double 0xBF5F91A9EE0D218C, double 0xBF5F51C24898187F, double 0x3F16B4C9CA04065C, double 0x3F063C547294C80D, double 0xBEBE3725C3BED76A, double 0xBEA25C1053590F28, double 0x3E57485BC4AFFD32, double 0x3E33E27187DB1B90, double 0xBDE77B93FF00A8D9, double 0xBDBDB9D1890C1963, double 0x3D69BC7332D23C98, double 0xBFCDDCEB4CE1BF4A, double 0xBC44E6F0FF2BE5DA, double 0x3FBDA52116C0A63F, double 0xBF6A9DA4603B66C1, double 0xBF8331E74EA59A28, double 0x3F33E5CB6EB9D4D2, double 0x3F33885FE9AEE88D, double 0xBEE494C0F422BE24, double 0xBED512B9D2882A32, double 0x3E85A86081766E10, double 0x3E6C323D60D5C85A, double 0xBE1BCC0C4C6C296F, double 0xBDF9BBB359D527C1, double 0x3DA7E38DB953D46D, double 0x3D80C831B59F5952], align 8

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_j1(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %319

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp ugt double %36, 0x4029080000000000
  br i1 %37, label %111, label %38

38:                                               ; preds = %32
  %39 = fcmp ugt double %36, 0x4018B00000000000
  br i1 %39, label %51, label %40

40:                                               ; preds = %38
  %41 = fcmp ugt double %36, 1.093750e+00
  br i1 %41, label %42, label %62

42:                                               ; preds = %40
  %43 = fcmp ugt double %36, 2.843750e+00
  %44 = fcmp ugt double %36, 0x4012500000000000
  %45 = select i1 %44, double 0x3CA5C646A75D7539, double 0xBCA60155A9D1B256
  %46 = select i1 %44, double 0x40155365BC032467, double 0x400EA75575AF6F09
  %47 = select i1 %44, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 45), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 30)
  %48 = select i1 %43, double %45, double 0x3C5616D820CFDAEB
  %49 = select i1 %43, double %46, double 0x3FFD757D1FEC8A3A
  %50 = select i1 %43, double addrspace(4)* %47, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 15)
  br label %62

51:                                               ; preds = %38
  %52 = fcmp ugt double %36, 7.781250e+00
  br i1 %52, label %53, label %62

53:                                               ; preds = %51
  %54 = fcmp ugt double %36, 0x4022B80000000000
  %55 = fcmp ugt double %36, 0x4025E80000000000
  %56 = select i1 %55, double 0x3CC9A84D3A5FEDC2, double 0x3CC02610A51562B6
  %57 = select i1 %55, double 0x40276979797EE5AC, double 0x402458D0D0BDFC29
  %58 = select i1 %55, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 105), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 90)
  %59 = select i1 %54, double %56, double 0xBCA63E17EC20A31D
  %60 = select i1 %54, double %57, double 0x402112980F0B88A1
  %61 = select i1 %54, double addrspace(4)* %58, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 75)
  br label %62

62:                                               ; preds = %53, %51, %42, %40
  %63 = phi double [ 0.000000e+00, %40 ], [ 0xBC9B226D9D243827, %51 ], [ %48, %42 ], [ %59, %53 ]
  %64 = phi double [ 0.000000e+00, %40 ], [ 0x401C0FF5F3B47250, %51 ], [ %49, %42 ], [ %60, %53 ]
  %65 = phi double addrspace(4)* [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 0), %40 ], [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 60), %51 ], [ %50, %42 ], [ %61, %53 ]
  %66 = fsub double %36, %64
  %67 = fsub double %66, %63
  %68 = getelementptr inbounds double, double addrspace(4)* %65, i64 14
  %69 = load double, double addrspace(4)* %68, align 8, !tbaa !20
  %70 = getelementptr inbounds double, double addrspace(4)* %65, i64 13
  %71 = load double, double addrspace(4)* %70, align 8, !tbaa !20
  %72 = tail call double @llvm.fma.f64(double %67, double %69, double %71)
  %73 = getelementptr inbounds double, double addrspace(4)* %65, i64 12
  %74 = load double, double addrspace(4)* %73, align 8, !tbaa !20
  %75 = tail call double @llvm.fma.f64(double %67, double %72, double %74)
  %76 = getelementptr inbounds double, double addrspace(4)* %65, i64 11
  %77 = load double, double addrspace(4)* %76, align 8, !tbaa !20
  %78 = tail call double @llvm.fma.f64(double %67, double %75, double %77)
  %79 = getelementptr inbounds double, double addrspace(4)* %65, i64 10
  %80 = load double, double addrspace(4)* %79, align 8, !tbaa !20
  %81 = tail call double @llvm.fma.f64(double %67, double %78, double %80)
  %82 = getelementptr inbounds double, double addrspace(4)* %65, i64 9
  %83 = load double, double addrspace(4)* %82, align 8, !tbaa !20
  %84 = tail call double @llvm.fma.f64(double %67, double %81, double %83)
  %85 = getelementptr inbounds double, double addrspace(4)* %65, i64 8
  %86 = load double, double addrspace(4)* %85, align 8, !tbaa !20
  %87 = tail call double @llvm.fma.f64(double %67, double %84, double %86)
  %88 = getelementptr inbounds double, double addrspace(4)* %65, i64 7
  %89 = load double, double addrspace(4)* %88, align 8, !tbaa !20
  %90 = tail call double @llvm.fma.f64(double %67, double %87, double %89)
  %91 = getelementptr inbounds double, double addrspace(4)* %65, i64 6
  %92 = load double, double addrspace(4)* %91, align 8, !tbaa !20
  %93 = tail call double @llvm.fma.f64(double %67, double %90, double %92)
  %94 = getelementptr inbounds double, double addrspace(4)* %65, i64 5
  %95 = load double, double addrspace(4)* %94, align 8, !tbaa !20
  %96 = tail call double @llvm.fma.f64(double %67, double %93, double %95)
  %97 = getelementptr inbounds double, double addrspace(4)* %65, i64 4
  %98 = load double, double addrspace(4)* %97, align 8, !tbaa !20
  %99 = tail call double @llvm.fma.f64(double %67, double %96, double %98)
  %100 = getelementptr inbounds double, double addrspace(4)* %65, i64 3
  %101 = load double, double addrspace(4)* %100, align 8, !tbaa !20
  %102 = tail call double @llvm.fma.f64(double %67, double %99, double %101)
  %103 = getelementptr inbounds double, double addrspace(4)* %65, i64 2
  %104 = load double, double addrspace(4)* %103, align 8, !tbaa !20
  %105 = tail call double @llvm.fma.f64(double %67, double %102, double %104)
  %106 = getelementptr inbounds double, double addrspace(4)* %65, i64 1
  %107 = load double, double addrspace(4)* %106, align 8, !tbaa !20
  %108 = tail call double @llvm.fma.f64(double %67, double %105, double %107)
  %109 = load double, double addrspace(4)* %65, align 8, !tbaa !20
  %110 = tail call double @llvm.fma.f64(double %67, double %108, double %109)
  br label %313

111:                                              ; preds = %32
  %112 = fdiv double 1.000000e+00, %36
  %113 = fmul double %112, %112
  %114 = tail call double @llvm.fma.f64(double %113, double 0x41BC22F653D3A76E, double 0xC1780A4D95ED3E8E)
  %115 = tail call double @llvm.fma.f64(double %113, double %114, double 0x41272F1D1F8CDD76)
  %116 = tail call double @llvm.fma.f64(double %113, double %115, double 0xC0D3EA4E96460AD7)
  %117 = tail call double @llvm.fma.f64(double %113, double %116, double 0x408488DD98D9AB3A)
  %118 = tail call double @llvm.fma.f64(double %113, double %117, double 0xC03E9ED612FA3B38)
  %119 = tail call double @llvm.fma.f64(double %113, double %118, double 0x4002F484FCAB9DDA)
  %120 = tail call double @llvm.fma.f64(double %113, double %119, double 0xBFD7BCCCCAD443C0)
  %121 = tail call double @llvm.fma.f64(double %113, double %120, double 0x3FC4FFFFFFFFCBFA)
  %122 = tail call double @llvm.fma.f64(double %113, double %121, double -3.750000e-01)
  %123 = fmul double %112, %122
  %124 = tail call double @llvm.amdgcn.rsq.f64(double %112)
  %125 = fmul double %112, %124
  %126 = fmul double %124, 5.000000e-01
  %127 = fneg double %126
  %128 = tail call double @llvm.fma.f64(double %127, double %125, double 5.000000e-01)
  %129 = tail call double @llvm.fma.f64(double %126, double %128, double %126)
  %130 = tail call double @llvm.fma.f64(double %125, double %128, double %125)
  %131 = fneg double %130
  %132 = tail call double @llvm.fma.f64(double %131, double %130, double %112)
  %133 = tail call double @llvm.fma.f64(double %132, double %129, double %130)
  %134 = fcmp oeq double %112, 0.000000e+00
  %135 = select i1 %134, double %112, double %133
  %136 = fmul double %135, 0x3FE9884533D43651
  %137 = tail call double @llvm.fma.f64(double %113, double 0xC137940A06621145, double 0x40F591FB68428BAF)
  %138 = tail call double @llvm.fma.f64(double %113, double %137, double 0xC0A996552A8BAFB0)
  %139 = tail call double @llvm.fma.f64(double %113, double %138, double 0x4060795578CD8C93)
  %140 = tail call double @llvm.fma.f64(double %113, double %139, double 0xC01EF38364596B5A)
  %141 = tail call double @llvm.fma.f64(double %113, double %140, double 0x3FE9C4FA465744C7)
  %142 = tail call double @llvm.fma.f64(double %113, double %141, double 0xBFC8BFFFFC3937C1)
  %143 = tail call double @llvm.fma.f64(double %113, double %142, double 0x3FC7FFFFFFFFC240)
  %144 = tail call double @llvm.fma.f64(double %113, double %143, double 1.000000e+00)
  %145 = fmul double %136, %144
  %146 = fcmp olt double %36, 0x41D0000000000000
  br i1 %146, label %147, label %166

147:                                              ; preds = %111
  %148 = fmul double %36, 0x3FE45F306DC9C883
  %149 = tail call double @llvm.rint.f64(double %148)
  %150 = tail call double @llvm.fma.f64(double %149, double 0xBFF921FB54442D18, double %36)
  %151 = tail call double @llvm.fma.f64(double %149, double 0xBC91A62633145C00, double %150)
  %152 = fmul double %149, 0x3C91A62633145C00
  %153 = fneg double %152
  %154 = tail call double @llvm.fma.f64(double %149, double 0x3C91A62633145C00, double %153)
  %155 = fsub double %150, %152
  %156 = fsub double %150, %155
  %157 = fsub double %156, %152
  %158 = fsub double %155, %151
  %159 = fadd double %158, %157
  %160 = fsub double %159, %154
  %161 = tail call double @llvm.fma.f64(double %149, double 0xB97B839A252049C0, double %160)
  %162 = fadd double %151, %161
  %163 = fsub double %162, %151
  %164 = fsub double %161, %163
  %165 = fptosi double %149 to i32
  br label %242

166:                                              ; preds = %111
  %167 = tail call double @llvm.amdgcn.trig.preop.f64(double %36, i32 0)
  %168 = tail call double @llvm.amdgcn.trig.preop.f64(double %36, i32 1)
  %169 = tail call double @llvm.amdgcn.trig.preop.f64(double %36, i32 2)
  %170 = fcmp oge double %36, 0x7B00000000000000
  %171 = tail call double @llvm.amdgcn.ldexp.f64(double %36, i32 -128)
  %172 = select i1 %170, double %171, double %36
  %173 = fmul double %169, %172
  %174 = fneg double %173
  %175 = tail call double @llvm.fma.f64(double %169, double %172, double %174)
  %176 = fmul double %168, %172
  %177 = fneg double %176
  %178 = tail call double @llvm.fma.f64(double %168, double %172, double %177)
  %179 = fmul double %167, %172
  %180 = fneg double %179
  %181 = tail call double @llvm.fma.f64(double %167, double %172, double %180)
  %182 = fadd double %176, %181
  %183 = fsub double %182, %176
  %184 = fsub double %182, %183
  %185 = fsub double %181, %183
  %186 = fsub double %176, %184
  %187 = fadd double %185, %186
  %188 = fadd double %173, %178
  %189 = fsub double %188, %173
  %190 = fsub double %188, %189
  %191 = fsub double %178, %189
  %192 = fsub double %173, %190
  %193 = fadd double %191, %192
  %194 = fadd double %188, %187
  %195 = fsub double %194, %188
  %196 = fsub double %194, %195
  %197 = fsub double %187, %195
  %198 = fsub double %188, %196
  %199 = fadd double %197, %198
  %200 = fadd double %193, %199
  %201 = fadd double %175, %200
  %202 = fadd double %179, %182
  %203 = fsub double %202, %179
  %204 = fsub double %182, %203
  %205 = fadd double %204, %194
  %206 = fsub double %205, %204
  %207 = fsub double %194, %206
  %208 = fadd double %207, %201
  %209 = tail call double @llvm.amdgcn.ldexp.f64(double %202, i32 -2)
  %210 = tail call double @llvm.amdgcn.fract.f64(double %209)
  %211 = tail call i1 @llvm.amdgcn.class.f64(double %209, i32 516)
  %212 = select i1 %211, double 0.000000e+00, double %210
  %213 = tail call double @llvm.amdgcn.ldexp.f64(double %212, i32 2)
  %214 = fadd double %213, %205
  %215 = fcmp olt double %214, 0.000000e+00
  %216 = select i1 %215, double 4.000000e+00, double 0.000000e+00
  %217 = fadd double %213, %216
  %218 = fadd double %205, %217
  %219 = fptosi double %218 to i32
  %220 = sitofp i32 %219 to double
  %221 = fsub double %217, %220
  %222 = fadd double %205, %221
  %223 = fsub double %222, %221
  %224 = fsub double %205, %223
  %225 = fadd double %208, %224
  %226 = fcmp oge double %222, 5.000000e-01
  %227 = zext i1 %226 to i32
  %228 = add nsw i32 %227, %219
  %229 = select i1 %226, double 1.000000e+00, double 0.000000e+00
  %230 = fsub double %222, %229
  %231 = fadd double %230, %225
  %232 = fsub double %231, %230
  %233 = fsub double %225, %232
  %234 = fmul double %231, 0x3FF921FB54442D18
  %235 = fneg double %234
  %236 = tail call double @llvm.fma.f64(double %231, double 0x3FF921FB54442D18, double %235)
  %237 = tail call double @llvm.fma.f64(double %231, double 0x3C91A62633145C07, double %236)
  %238 = tail call double @llvm.fma.f64(double %233, double 0x3FF921FB54442D18, double %237)
  %239 = fadd double %234, %238
  %240 = fsub double %239, %234
  %241 = fsub double %238, %240
  br label %242

242:                                              ; preds = %166, %147
  %243 = phi double [ %164, %147 ], [ %241, %166 ]
  %244 = phi double [ %162, %147 ], [ %239, %166 ]
  %245 = phi i32 [ %165, %147 ], [ %228, %166 ]
  %246 = and i32 %245, 3
  %247 = fcmp olt double %244, %123
  %248 = sext i1 %247 to i32
  %249 = add nsw i32 %246, -1
  %250 = add nsw i32 %249, %248
  %251 = select i1 %247, i32 -2147483648, i32 0
  %252 = xor i32 %251, -1075240453
  %253 = insertelement <2 x i32> <i32 1413754136, i32 poison>, i32 %252, i64 1
  %254 = bitcast <2 x i32> %253 to double
  %255 = xor i32 %251, -1132354010
  %256 = insertelement <2 x i32> <i32 856972295, i32 poison>, i32 %255, i64 1
  %257 = bitcast <2 x i32> %256 to double
  %258 = fsub double %254, %123
  %259 = fsub double %254, %258
  %260 = fsub double %259, %123
  %261 = fadd double %260, %257
  %262 = fadd double %258, %261
  %263 = fsub double %262, %258
  %264 = fsub double %261, %263
  %265 = fadd double %244, %262
  %266 = fsub double %265, %262
  %267 = fsub double %244, %266
  %268 = fadd double %243, %264
  %269 = fadd double %267, %268
  %270 = fadd double %265, %269
  %271 = fsub double %270, %265
  %272 = fsub double %269, %271
  %273 = fmul double %270, %270
  %274 = fmul double %273, 5.000000e-01
  %275 = fsub double 1.000000e+00, %274
  %276 = fsub double 1.000000e+00, %275
  %277 = fsub double %276, %274
  %278 = fmul double %273, %273
  %279 = tail call double @llvm.fma.f64(double %273, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %280 = tail call double @llvm.fma.f64(double %273, double %279, double 0xBE927E4FA17F65F6)
  %281 = tail call double @llvm.fma.f64(double %273, double %280, double 0x3EFA01A019F4EC90)
  %282 = tail call double @llvm.fma.f64(double %273, double %281, double 0xBF56C16C16C16967)
  %283 = tail call double @llvm.fma.f64(double %273, double %282, double 0x3FA5555555555555)
  %284 = fneg double %272
  %285 = tail call double @llvm.fma.f64(double %270, double %284, double %277)
  %286 = tail call double @llvm.fma.f64(double %278, double %283, double %285)
  %287 = fadd double %275, %286
  %288 = tail call double @llvm.fma.f64(double %273, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %289 = tail call double @llvm.fma.f64(double %273, double %288, double 0x3EC71DE3796CDE01)
  %290 = tail call double @llvm.fma.f64(double %273, double %289, double 0xBF2A01A019E83E5C)
  %291 = tail call double @llvm.fma.f64(double %273, double %290, double 0x3F81111111110BB3)
  %292 = fneg double %273
  %293 = fmul double %270, %292
  %294 = fmul double %272, 5.000000e-01
  %295 = tail call double @llvm.fma.f64(double %293, double %291, double %294)
  %296 = tail call double @llvm.fma.f64(double %273, double %295, double %284)
  %297 = tail call double @llvm.fma.f64(double %293, double 0xBFC5555555555555, double %296)
  %298 = fsub double %270, %297
  %299 = fneg double %298
  %300 = and i32 %250, 1
  %301 = icmp eq i32 %300, 0
  %302 = select i1 %301, double %287, double %299
  %303 = bitcast double %302 to <2 x i32>
  %304 = shl i32 %250, 30
  %305 = and i32 %304, -2147483648
  %306 = extractelement <2 x i32> %303, i64 1
  %307 = xor i32 %306, %305
  %308 = insertelement <2 x i32> %303, i32 %307, i64 1
  %309 = bitcast <2 x i32> %308 to double
  %310 = fmul double %145, %309
  %311 = tail call i1 @llvm.amdgcn.class.f64(double %36, i32 512)
  %312 = select i1 %311, double 0.000000e+00, double %310
  br label %313

313:                                              ; preds = %62, %242
  %314 = phi double [ %110, %62 ], [ %312, %242 ]
  %315 = fcmp olt double %35, 0.000000e+00
  %316 = fneg double %314
  %317 = select i1 %315, double %316, double %314
  %318 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %317, double addrspace(1)* %318, align 8, !tbaa !16
  br label %319

319:                                              ; preds = %313, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"double", !10, i64 0}
