; ModuleID = '../data/hip_kernels/1143/54/main.cu'
source_filename = "../data/hip_kernels/1143/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17kring_rotation_AyPdS_S_ddddddddS_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double %3, double %4, double %5, double %6, double %7, double %8, double %9, double %10, double addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !4
  %19 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !13, !invariant.load !14
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %18, %22
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 16
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 8, !tbaa !15
  %27 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = udiv i32 %26, %30
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %33 = mul i32 %13, %22
  %34 = mul i32 %14, %30
  %35 = getelementptr i8, i8 addrspace(4)* %15, i64 8
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !13, !invariant.load !14
  %38 = zext i16 %37 to i32
  %39 = mul i32 %32, %38
  %40 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %41 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %43 = add i32 %33, %42
  %44 = add i32 %34, %40
  %45 = add i32 %39, %41
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !17, !amdgpu.noclobber !14
  %49 = sext i32 %43 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !17, !amdgpu.noclobber !14
  %52 = tail call double @llvm.fabs.f64(double %48)
  %53 = tail call double @llvm.fabs.f64(double %51)
  %54 = tail call double @llvm.maxnum.f64(double %53, double %52)
  %55 = tail call double @llvm.minnum.f64(double %53, double %52)
  %56 = fdiv double %55, %54
  %57 = fmul double %56, %56
  %58 = tail call double @llvm.fma.f64(double %57, double 0x3EEBA404B5E68A13, double 0xBF23E260BD3237F4)
  %59 = tail call double @llvm.fma.f64(double %57, double %58, double 0x3F4B2BB069EFB384)
  %60 = tail call double @llvm.fma.f64(double %57, double %59, double 0xBF67952DAF56DE9B)
  %61 = tail call double @llvm.fma.f64(double %57, double %60, double 0x3F7D6D43A595C56F)
  %62 = tail call double @llvm.fma.f64(double %57, double %61, double 0xBF8C6EA4A57D9582)
  %63 = tail call double @llvm.fma.f64(double %57, double %62, double 0x3F967E295F08B19F)
  %64 = tail call double @llvm.fma.f64(double %57, double %63, double 0xBF9E9AE6FC27006A)
  %65 = tail call double @llvm.fma.f64(double %57, double %64, double 0x3FA2C15B5711927A)
  %66 = tail call double @llvm.fma.f64(double %57, double %65, double 0xBFA59976E82D3FF0)
  %67 = tail call double @llvm.fma.f64(double %57, double %66, double 0x3FA82D5D6EF28734)
  %68 = tail call double @llvm.fma.f64(double %57, double %67, double 0xBFAAE5CE6A214619)
  %69 = tail call double @llvm.fma.f64(double %57, double %68, double 0x3FAE1BB48427B883)
  %70 = tail call double @llvm.fma.f64(double %57, double %69, double 0xBFB110E48B207F05)
  %71 = tail call double @llvm.fma.f64(double %57, double %70, double 0x3FB3B13657B87036)
  %72 = tail call double @llvm.fma.f64(double %57, double %71, double 0xBFB745D119378E4F)
  %73 = tail call double @llvm.fma.f64(double %57, double %72, double 0x3FBC71C717E1913C)
  %74 = tail call double @llvm.fma.f64(double %57, double %73, double 0xBFC2492492376B7D)
  %75 = tail call double @llvm.fma.f64(double %57, double %74, double 0x3FC99999999952CC)
  %76 = tail call double @llvm.fma.f64(double %57, double %75, double 0xBFD5555555555523)
  %77 = fmul double %57, %76
  %78 = tail call double @llvm.fma.f64(double %56, double %77, double %56)
  %79 = bitcast double %51 to <2 x i32>
  %80 = extractelement <2 x i32> %79, i64 1
  %81 = icmp slt i32 %80, 0
  %82 = fsub double 0x3FF921FB54442D18, %78
  %83 = fcmp olt double %53, %52
  %84 = select i1 %83, double %82, double %78
  %85 = fcmp uno double %51, %48
  %86 = fcmp oeq double %52, 0x7FF0000000000000
  %87 = fcmp oeq double %53, 0x7FF0000000000000
  %88 = and i1 %86, %87
  %89 = select i1 %81, double 0x4002D97C7F3321D2, double 0x3FE921FB54442D18
  %90 = tail call double @llvm.copysign.f64(double %89, double %48)
  %91 = fcmp oeq double %48, 0.000000e+00
  %92 = select i1 %81, double 0x400921FB54442D18, double 0.000000e+00
  %93 = fsub double 0x400921FB54442D18, %84
  %94 = select i1 %81, double %93, double %84
  %95 = select i1 %91, double %92, double %94
  %96 = select i1 %88, double %90, double %95
  %97 = select i1 %85, double 0x7FF8000000000000, double %96
  %98 = sext i32 %45 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %2, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !17, !amdgpu.noclobber !14
  %101 = tail call double @llvm.fabs.f64(double %97)
  %102 = fcmp olt double %101, 0x41D0000000000000
  br i1 %102, label %103, label %122

103:                                              ; preds = %12
  %104 = fmul double %101, 0x3FE45F306DC9C883
  %105 = tail call double @llvm.rint.f64(double %104)
  %106 = tail call double @llvm.fma.f64(double %105, double 0xBFF921FB54442D18, double %101)
  %107 = tail call double @llvm.fma.f64(double %105, double 0xBC91A62633145C00, double %106)
  %108 = fmul double %105, 0x3C91A62633145C00
  %109 = fneg double %108
  %110 = tail call double @llvm.fma.f64(double %105, double 0x3C91A62633145C00, double %109)
  %111 = fsub double %106, %108
  %112 = fsub double %106, %111
  %113 = fsub double %112, %108
  %114 = fsub double %111, %107
  %115 = fadd double %114, %113
  %116 = fsub double %115, %110
  %117 = tail call double @llvm.fma.f64(double %105, double 0xB97B839A252049C0, double %116)
  %118 = fadd double %107, %117
  %119 = fsub double %118, %107
  %120 = fsub double %117, %119
  %121 = fptosi double %105 to i32
  br label %198

122:                                              ; preds = %12
  %123 = tail call double @llvm.amdgcn.trig.preop.f64(double %101, i32 0)
  %124 = tail call double @llvm.amdgcn.trig.preop.f64(double %101, i32 1)
  %125 = tail call double @llvm.amdgcn.trig.preop.f64(double %101, i32 2)
  %126 = fcmp oge double %101, 0x7B00000000000000
  %127 = tail call double @llvm.amdgcn.ldexp.f64(double %101, i32 -128)
  %128 = select i1 %126, double %127, double %101
  %129 = fmul double %125, %128
  %130 = fneg double %129
  %131 = tail call double @llvm.fma.f64(double %125, double %128, double %130)
  %132 = fmul double %124, %128
  %133 = fneg double %132
  %134 = tail call double @llvm.fma.f64(double %124, double %128, double %133)
  %135 = fmul double %123, %128
  %136 = fneg double %135
  %137 = tail call double @llvm.fma.f64(double %123, double %128, double %136)
  %138 = fadd double %132, %137
  %139 = fsub double %138, %132
  %140 = fsub double %138, %139
  %141 = fsub double %137, %139
  %142 = fsub double %132, %140
  %143 = fadd double %141, %142
  %144 = fadd double %129, %134
  %145 = fsub double %144, %129
  %146 = fsub double %144, %145
  %147 = fsub double %134, %145
  %148 = fsub double %129, %146
  %149 = fadd double %147, %148
  %150 = fadd double %144, %143
  %151 = fsub double %150, %144
  %152 = fsub double %150, %151
  %153 = fsub double %143, %151
  %154 = fsub double %144, %152
  %155 = fadd double %153, %154
  %156 = fadd double %149, %155
  %157 = fadd double %131, %156
  %158 = fadd double %135, %138
  %159 = fsub double %158, %135
  %160 = fsub double %138, %159
  %161 = fadd double %160, %150
  %162 = fsub double %161, %160
  %163 = fsub double %150, %162
  %164 = fadd double %163, %157
  %165 = tail call double @llvm.amdgcn.ldexp.f64(double %158, i32 -2)
  %166 = tail call double @llvm.amdgcn.fract.f64(double %165)
  %167 = tail call i1 @llvm.amdgcn.class.f64(double %165, i32 516)
  %168 = select i1 %167, double 0.000000e+00, double %166
  %169 = tail call double @llvm.amdgcn.ldexp.f64(double %168, i32 2)
  %170 = fadd double %169, %161
  %171 = fcmp olt double %170, 0.000000e+00
  %172 = select i1 %171, double 4.000000e+00, double 0.000000e+00
  %173 = fadd double %169, %172
  %174 = fadd double %161, %173
  %175 = fptosi double %174 to i32
  %176 = sitofp i32 %175 to double
  %177 = fsub double %173, %176
  %178 = fadd double %161, %177
  %179 = fsub double %178, %177
  %180 = fsub double %161, %179
  %181 = fadd double %164, %180
  %182 = fcmp oge double %178, 5.000000e-01
  %183 = zext i1 %182 to i32
  %184 = add nsw i32 %183, %175
  %185 = select i1 %182, double 1.000000e+00, double 0.000000e+00
  %186 = fsub double %178, %185
  %187 = fadd double %186, %181
  %188 = fsub double %187, %186
  %189 = fsub double %181, %188
  %190 = fmul double %187, 0x3FF921FB54442D18
  %191 = fneg double %190
  %192 = tail call double @llvm.fma.f64(double %187, double 0x3FF921FB54442D18, double %191)
  %193 = tail call double @llvm.fma.f64(double %187, double 0x3C91A62633145C07, double %192)
  %194 = tail call double @llvm.fma.f64(double %189, double 0x3FF921FB54442D18, double %193)
  %195 = fadd double %190, %194
  %196 = fsub double %195, %190
  %197 = fsub double %194, %196
  br label %198

198:                                              ; preds = %103, %122
  %199 = phi double [ %120, %103 ], [ %197, %122 ]
  %200 = phi double [ %118, %103 ], [ %195, %122 ]
  %201 = phi i32 [ %121, %103 ], [ %184, %122 ]
  %202 = tail call double @llvm.copysign.f64(double %97, double %48)
  %203 = fadd contract double %100, %5
  %204 = mul i32 %31, %30
  %205 = icmp ugt i32 %26, %204
  %206 = zext i1 %205 to i32
  %207 = add i32 %31, %206
  %208 = mul i32 %207, %32
  %209 = add i32 %208, %14
  %210 = mul i32 %23, %22
  %211 = icmp ugt i32 %18, %210
  %212 = zext i1 %211 to i32
  %213 = add i32 %23, %212
  %214 = mul i32 %209, %213
  %215 = add i32 %214, %13
  %216 = mul i32 %215, %38
  %217 = add i32 %216, %41
  %218 = mul i32 %217, %30
  %219 = add i32 %218, %40
  %220 = mul i32 %219, %22
  %221 = add i32 %220, %42
  %222 = fmul double %200, %200
  %223 = fmul double %222, 5.000000e-01
  %224 = fsub double 1.000000e+00, %223
  %225 = fsub double 1.000000e+00, %224
  %226 = fsub double %225, %223
  %227 = fmul double %222, %222
  %228 = tail call double @llvm.fma.f64(double %222, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %229 = tail call double @llvm.fma.f64(double %222, double %228, double 0xBE927E4FA17F65F6)
  %230 = tail call double @llvm.fma.f64(double %222, double %229, double 0x3EFA01A019F4EC90)
  %231 = tail call double @llvm.fma.f64(double %222, double %230, double 0xBF56C16C16C16967)
  %232 = tail call double @llvm.fma.f64(double %222, double %231, double 0x3FA5555555555555)
  %233 = fneg double %199
  %234 = tail call double @llvm.fma.f64(double %200, double %233, double %226)
  %235 = tail call double @llvm.fma.f64(double %227, double %232, double %234)
  %236 = fadd double %224, %235
  %237 = tail call double @llvm.fma.f64(double %222, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %238 = tail call double @llvm.fma.f64(double %222, double %237, double 0x3EC71DE3796CDE01)
  %239 = tail call double @llvm.fma.f64(double %222, double %238, double 0xBF2A01A019E83E5C)
  %240 = tail call double @llvm.fma.f64(double %222, double %239, double 0x3F81111111110BB3)
  %241 = fneg double %222
  %242 = fmul double %200, %241
  %243 = fmul double %199, 5.000000e-01
  %244 = tail call double @llvm.fma.f64(double %242, double %240, double %243)
  %245 = tail call double @llvm.fma.f64(double %222, double %244, double %233)
  %246 = tail call double @llvm.fma.f64(double %242, double 0xBFC5555555555555, double %245)
  %247 = fsub double %200, %246
  %248 = and i32 %201, 1
  %249 = icmp eq i32 %248, 0
  %250 = select i1 %249, double %247, double %236
  %251 = bitcast double %250 to <2 x i32>
  %252 = shl i32 %201, 30
  %253 = bitcast double %202 to <2 x i32>
  %254 = extractelement <2 x i32> %253, i64 1
  %255 = xor i32 %252, %254
  %256 = and i32 %255, -2147483648
  %257 = extractelement <2 x i32> %251, i64 1
  %258 = xor i32 %257, %256
  %259 = insertelement <2 x i32> %251, i32 %258, i64 1
  %260 = tail call i1 @llvm.amdgcn.class.f64(double %101, i32 504)
  %261 = select i1 %260, <2 x i32> %259, <2 x i32> <i32 0, i32 2146959360>
  %262 = bitcast <2 x i32> %261 to double
  %263 = fmul contract double %203, %262
  %264 = fmul contract double %263, %9
  %265 = fmul contract double %264, %6
  %266 = sext i32 %221 to i64
  %267 = getelementptr inbounds double, double addrspace(1)* %11, i64 %266
  store double %265, double addrspace(1)* %267, align 8, !tbaa !17
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
