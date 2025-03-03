; ModuleID = '../data/hip_kernels/16034/54/main.cu'
source_filename = "../data/hip_kernels/16034/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__ocmltbl_M64_J0 = internal unnamed_addr addrspace(4) constant [120 x double] [double 1.000000e+00, double 0xBCA4907401F4E73A, double 0xBFCFFFFFFFFFFF20, double 0xBD3E2AEB92C11928, double 0x3F90000000044077, double 0xBD971846E585E8C0, double 0xBF3C71C707FC64A5, double 0xBDC8D2E5CA2E7507, double 0x3EDC71DC58841F48, double 0xBDD9FB942A93AF21, double 0xBE722EA554940614, double 0xBDCC309762886108, double 0x3E00ECE316EB4BD4, double 0xBD99479286F572FD, double 0xBD7CBB10470436C0, double 0.000000e+00, double 0xBFE09CDB36551280, double 0x3FBBA1DEEA029494, double 0x3FACFAE864368D6B, double 0xBF81BB1CBE1A406D, double 0xBF61F992590D0897, double 0x3F315382BA06BF05, double 0x3F06ED3B9EEC933D, double 0xBED232C77D035520, double 0xBEA1CCE2DF6157CA, double 0x3E67FF98D2088A17, double 0x3E3294ED7209404C, double 0xBDF5C278F4188E72, double 0xBDBB9F73114AC14B, double 0x3D7C870190FB4FF7, double 0xBFD9C6CF582CBF7F, double 0xBC2340630BE882E1, double 0x3FC9C6CF582CBF7E, double 0xBF91F06D14E11DF9, double 0xBF8B589D1DA136E9, double 0x3F50F9103CF5A452, double 0x3F3864456219E47E, double 0xBEFA2A033CAECDFC, double 0xBED83A06DF50149A, double 0x3E96A4FD6F3E37BF, double 0x3E6EC03769300BBD, double 0xBE295D7532C9AE75, double 0xBDFB1AA7F95EB2B7, double 0x3DB3D0E8D4F46C36, double 0x3D809643D778859E, double 0.000000e+00, double 0x3FD5C6E60A097823, double 0xBF9F8F72E7A848E0, double 0xBFAB2150CB41E89B, double 0x3F72F7FFE90256AB, double 0x3F627E31FE9A6359, double 0xBF26F641F41949DF, double 0xBF0863F48139D08A, double 0x3ECAD77D74A4EB89, double 0x3EA32E6D3322F526, double 0xBE62DA3821A66401, double 0xBE341D0E8E78F041, double 0x3DF1D089C7B66E54, double 0x3DBDD03E1BC02C21, double 0xBD786CDF5A3F3B8F, double 0x3FD33518B3874E8A, double 0x3C42F912ABC5C301, double 0xBFC33518B3874E8A, double 0x3F7D34125D59D874, double 0x3F880C83BDEEE45B, double 0xBF4483C20F1C66BB, double 0xBF36FFA5FC8AE7CE, double 0x3EF2CCF7B1D72132, double 0x3ED796A74FB77CDA, double 0xBE91E8509B04B9CD, double 0xBE6E6A46B48901DC, double 0x3E254BF2843030AB, double 0x3DFB064CF4B52F16, double 0xBDB14A00318682F1, double 0xBD81036310530753, double 0.000000e+00, double 0xBFD15F7977A772D4, double 0x3F900F7FCF183E0D, double 0x3FA68B984EC64925, double 0xBF648E63600D8406, double 0xBF60E0D60385856B, double 0x3F1D796052772F54, double 0x3F07800BC50775C0, double 0xBEC3324842D019A1, double 0xBEA30E8C77C13527, double 0x3E5CEDA4325E2826, double 0x3E3457DC477E660A, double 0xBDECAD9A4A509C92, double 0xBDBE864D9617E1BC, double 0x3D741351FE093D3D, double 0xBFCFF654544EBCD1, double 0xBC44353ED972A55A, double 0x3FBFF654544EBCD0, double 0xBF70C17FF72AFA55, double 0xBF84B0C5D5DA66C1, double 0x3F394154BE70516B, double 0x3F34E12C3066B4A0, double 0xBEE9F32FC1C76819, double 0xBED63C5473EF99E9, double 0x3E8ADBAF4ECA4D0D, double 0x3E6D601B6216D4A4, double 0xBE20EE907FEE672B, double 0xBDFA83C5BBB08015, double 0x3DACA66D05214D85, double 0x3D810D9EF3F98BE2, double 0.000000e+00, double 0x3FCDC13E66AC2E77, double 0xBF842FF0CDC58463, double 0xBFA38D1DD8992DF2, double 0x3F5A55E9B346EDA9, double 0x3F5E2E16F97CD3DB, double 0xBF13DFC3782ACFE1, double 0xBF05CE7F4928AEAE, double 0x3EBBB178DA527278, double 0x3EA2346D3235A301, double 0xBE5612F29B5796E6, double 0xBE33D74F0F21F0AB, double 0x3DE6DB6FEDBDD2D3, double 0x3DBE380534E5B583, double 0xBD70827A2A754FB8], align 8

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_j0(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %315

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp ugt double %36, 0x4029280000000000
  br i1 %37, label %111, label %38

38:                                               ; preds = %32
  %39 = fcmp ugt double %36, 0x4019100000000000
  br i1 %39, label %51, label %40

40:                                               ; preds = %38
  %41 = fcmp ugt double %36, 1.656250e+00
  br i1 %41, label %42, label %62

42:                                               ; preds = %40
  %43 = fcmp ugt double %36, 3.125000e+00
  %44 = fcmp ugt double %36, 4.687500e+00
  %45 = select i1 %44, double 0x3C975054CD60A517, double 0xBCA60155A9D1B256
  %46 = select i1 %44, double 0x4016148F5B2C2E45, double 0x400EA75575AF6F09
  %47 = select i1 %44, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 45), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 30)
  %48 = select i1 %43, double %45, double 0xBCA0F539D7DA258E
  %49 = select i1 %43, double %46, double 0x40033D152E971B40
  %50 = select i1 %43, double addrspace(4)* %47, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 15)
  br label %62

51:                                               ; preds = %38
  %52 = fcmp ugt double %36, 7.843750e+00
  br i1 %52, label %53, label %62

53:                                               ; preds = %51
  %54 = fcmp ugt double %36, 0x4022D80000000000
  %55 = fcmp ugt double %36, 0x4025F80000000000
  %56 = select i1 %55, double 0x3CB444FD5821D5B1, double 0x3CC02610A51562B6
  %57 = select i1 %55, double 0x40279544008272B6, double 0x402458D0D0BDFC29
  %58 = select i1 %55, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 105), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 90)
  %59 = select i1 %54, double %56, double 0xBCB51970714C7C25
  %60 = select i1 %54, double %57, double 0x40214EB56CCCDECA
  %61 = select i1 %54, double addrspace(4)* %58, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 75)
  br label %62

62:                                               ; preds = %53, %51, %42, %40
  %63 = phi double [ 0.000000e+00, %40 ], [ 0xBC9B226D9D243827, %51 ], [ %48, %42 ], [ %59, %53 ]
  %64 = phi double [ 0.000000e+00, %40 ], [ 0x401C0FF5F3B47250, %51 ], [ %49, %42 ], [ %60, %53 ]
  %65 = phi double addrspace(4)* [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 0), %40 ], [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 60), %51 ], [ %50, %42 ], [ %61, %53 ]
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
  br label %312

111:                                              ; preds = %32
  %112 = fdiv double 1.000000e+00, %36
  %113 = fmul double %112, %112
  %114 = tail call double @llvm.fma.f64(double %113, double 0xC1B91F780A4A989B, double 0x41752A41923B70A7)
  %115 = tail call double @llvm.fma.f64(double %113, double %114, double 0xC1240A5E31612A8D)
  %116 = tail call double @llvm.fma.f64(double %113, double %115, double 0x40D0C9A0CBE3B3B8)
  %117 = tail call double @llvm.fma.f64(double %113, double %116, double 0xC080AF76167FE583)
  %118 = tail call double @llvm.fma.f64(double %113, double %117, double 0x403778EA61B94139)
  %119 = tail call double @llvm.fma.f64(double %113, double %118, double 0xBFFA3581D1A82662)
  %120 = tail call double @llvm.fma.f64(double %113, double %119, double 0x3FCAD33330A1DAF2)
  %121 = tail call double @llvm.fma.f64(double %113, double %120, double 0xBFB0AAAAAAAA7909)
  %122 = tail call double @llvm.fma.f64(double %113, double %121, double 1.250000e-01)
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
  %137 = tail call double @llvm.fma.f64(double %113, double 0x41344395CD7AC32C, double 0xC0F25BF3ABBEE803)
  %138 = tail call double @llvm.fma.f64(double %113, double %137, double 0x40A55A4A78625B0F)
  %139 = tail call double @llvm.fma.f64(double %113, double %138, double 0xC05A826C7EA56321)
  %140 = tail call double @llvm.fma.f64(double %113, double %139, double 0x401763253BBF53B6)
  %141 = tail call double @llvm.fma.f64(double %113, double %140, double 0xBFE15EFAFF948953)
  %142 = tail call double @llvm.fma.f64(double %113, double %141, double 0x3FBA7FFFF967A1D4)
  %143 = tail call double @llvm.fma.f64(double %113, double %142, double 0xBFAFFFFFFFFF2868)
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
  %249 = add nsw i32 %246, %248
  %250 = select i1 %247, i32 -2147483648, i32 0
  %251 = xor i32 %250, -1075240453
  %252 = insertelement <2 x i32> <i32 1413754136, i32 poison>, i32 %251, i64 1
  %253 = bitcast <2 x i32> %252 to double
  %254 = xor i32 %250, -1132354010
  %255 = insertelement <2 x i32> <i32 856972295, i32 poison>, i32 %254, i64 1
  %256 = bitcast <2 x i32> %255 to double
  %257 = fsub double %253, %123
  %258 = fsub double %253, %257
  %259 = fsub double %258, %123
  %260 = fadd double %259, %256
  %261 = fadd double %257, %260
  %262 = fsub double %261, %257
  %263 = fsub double %260, %262
  %264 = fadd double %244, %261
  %265 = fsub double %264, %261
  %266 = fsub double %244, %265
  %267 = fadd double %243, %263
  %268 = fadd double %266, %267
  %269 = fadd double %264, %268
  %270 = fsub double %269, %264
  %271 = fsub double %268, %270
  %272 = fmul double %269, %269
  %273 = fmul double %272, 5.000000e-01
  %274 = fsub double 1.000000e+00, %273
  %275 = fsub double 1.000000e+00, %274
  %276 = fsub double %275, %273
  %277 = fmul double %272, %272
  %278 = tail call double @llvm.fma.f64(double %272, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %279 = tail call double @llvm.fma.f64(double %272, double %278, double 0xBE927E4FA17F65F6)
  %280 = tail call double @llvm.fma.f64(double %272, double %279, double 0x3EFA01A019F4EC90)
  %281 = tail call double @llvm.fma.f64(double %272, double %280, double 0xBF56C16C16C16967)
  %282 = tail call double @llvm.fma.f64(double %272, double %281, double 0x3FA5555555555555)
  %283 = fneg double %271
  %284 = tail call double @llvm.fma.f64(double %269, double %283, double %276)
  %285 = tail call double @llvm.fma.f64(double %277, double %282, double %284)
  %286 = fadd double %274, %285
  %287 = tail call double @llvm.fma.f64(double %272, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %288 = tail call double @llvm.fma.f64(double %272, double %287, double 0x3EC71DE3796CDE01)
  %289 = tail call double @llvm.fma.f64(double %272, double %288, double 0xBF2A01A019E83E5C)
  %290 = tail call double @llvm.fma.f64(double %272, double %289, double 0x3F81111111110BB3)
  %291 = fneg double %272
  %292 = fmul double %269, %291
  %293 = fmul double %271, 5.000000e-01
  %294 = tail call double @llvm.fma.f64(double %292, double %290, double %293)
  %295 = tail call double @llvm.fma.f64(double %272, double %294, double %283)
  %296 = tail call double @llvm.fma.f64(double %292, double 0xBFC5555555555555, double %295)
  %297 = fsub double %269, %296
  %298 = fneg double %297
  %299 = and i32 %249, 1
  %300 = icmp eq i32 %299, 0
  %301 = select i1 %300, double %286, double %298
  %302 = bitcast double %301 to <2 x i32>
  %303 = shl i32 %249, 30
  %304 = and i32 %303, -2147483648
  %305 = extractelement <2 x i32> %302, i64 1
  %306 = xor i32 %305, %304
  %307 = insertelement <2 x i32> %302, i32 %306, i64 1
  %308 = bitcast <2 x i32> %307 to double
  %309 = fmul double %145, %308
  %310 = tail call i1 @llvm.amdgcn.class.f64(double %36, i32 512)
  %311 = select i1 %310, double 0.000000e+00, double %309
  br label %312

312:                                              ; preds = %62, %242
  %313 = phi double [ %110, %62 ], [ %311, %242 ]
  %314 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %313, double addrspace(1)* %314, align 8, !tbaa !16
  br label %315

315:                                              ; preds = %312, %3
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
