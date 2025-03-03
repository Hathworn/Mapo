; ModuleID = '../data/hip_kernels/1058/2/main.cu'
source_filename = "../data/hip_kernels/1058/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12initSinusoidPfS_fiiff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp ult i32 %16, %3
  br i1 %17, label %18, label %34

18:                                               ; preds = %7
  %19 = fpext float %6 to double
  %20 = fpext float %5 to double
  %21 = add i32 %8, %15
  %22 = add i32 %21, -1
  br label %23

23:                                               ; preds = %18, %60
  %24 = phi i32 [ %16, %18 ], [ %116, %60 ]
  %25 = phi i32 [ 0, %18 ], [ %114, %60 ]
  %26 = icmp sgt i32 %24, 0
  br i1 %26, label %27, label %60

27:                                               ; preds = %23
  %28 = mul i32 %25, %13
  %29 = add i32 %22, %28
  %30 = and i32 %24, 7
  %31 = icmp ult i32 %29, 7
  br i1 %31, label %43, label %32

32:                                               ; preds = %27
  %33 = and i32 %24, -8
  br label %118

34:                                               ; preds = %60, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp eq i32 %16, 0
  %36 = icmp sgt i32 %4, 0
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %255

38:                                               ; preds = %34
  %39 = and i32 %4, 3
  %40 = icmp ult i32 %4, 4
  br i1 %40, label %233, label %41

41:                                               ; preds = %38
  %42 = and i32 %4, -4
  br label %172

43:                                               ; preds = %118, %27
  %44 = phi float [ undef, %27 ], [ %168, %118 ]
  %45 = phi i32 [ 0, %27 ], [ %169, %118 ]
  %46 = phi float [ 0.000000e+00, %27 ], [ %168, %118 ]
  %47 = icmp eq i32 %30, 0
  br i1 %47, label %60, label %48

48:                                               ; preds = %43, %48
  %49 = phi i32 [ %57, %48 ], [ %45, %43 ]
  %50 = phi float [ %56, %48 ], [ %46, %43 ]
  %51 = phi i32 [ %58, %48 ], [ 0, %43 ]
  %52 = add nsw i32 %49, %4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fadd contract float %50, %55
  %57 = add nuw nsw i32 %49, 1
  %58 = add i32 %51, 1
  %59 = icmp eq i32 %58, %30
  br i1 %59, label %60, label %48, !llvm.loop !11

60:                                               ; preds = %43, %48, %23
  %61 = phi float [ 0.000000e+00, %23 ], [ %44, %43 ], [ %56, %48 ]
  %62 = fdiv contract float %61, %2
  %63 = fmul contract float %62, 2.000000e+00
  %64 = fpext float %63 to double
  %65 = tail call double @llvm.fabs.f64(double %64)
  %66 = fmul double %65, 5.000000e-01
  %67 = tail call double @llvm.amdgcn.fract.f64(double %66)
  %68 = tail call i1 @llvm.amdgcn.class.f64(double %66, i32 516)
  %69 = fmul double %67, 2.000000e+00
  %70 = select i1 %68, double 0.000000e+00, double %69
  %71 = fcmp ogt double %65, 1.000000e+00
  %72 = select i1 %71, double %70, double %65
  %73 = fmul double %72, 2.000000e+00
  %74 = tail call double @llvm.rint.f64(double %73)
  %75 = tail call double @llvm.fma.f64(double %74, double -5.000000e-01, double %72)
  %76 = fptosi double %74 to i32
  %77 = fmul double %75, %75
  %78 = tail call double @llvm.fma.f64(double %77, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %79 = tail call double @llvm.fma.f64(double %77, double %78, double 0x3FB50782D5F14825)
  %80 = tail call double @llvm.fma.f64(double %77, double %79, double 0xBFE32D2CCDFE9424)
  %81 = tail call double @llvm.fma.f64(double %77, double %80, double 0x400466BC67754FFF)
  %82 = tail call double @llvm.fma.f64(double %77, double %81, double 0xC014ABBCE625BE09)
  %83 = fmul double %75, %77
  %84 = fmul double %83, %82
  %85 = tail call double @llvm.fma.f64(double %75, double 0x400921FB54442D18, double %84)
  %86 = tail call double @llvm.fma.f64(double %77, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %87 = tail call double @llvm.fma.f64(double %77, double %86, double 0xBF9A6D1E7294BFF9)
  %88 = tail call double @llvm.fma.f64(double %77, double %87, double 0x3FCE1F5067B90B37)
  %89 = tail call double @llvm.fma.f64(double %77, double %88, double 0xBFF55D3C7E3C325B)
  %90 = tail call double @llvm.fma.f64(double %77, double %89, double 0x40103C1F081B5A67)
  %91 = tail call double @llvm.fma.f64(double %77, double %90, double 0xC013BD3CC9BE45DE)
  %92 = tail call double @llvm.fma.f64(double %77, double %91, double 1.000000e+00)
  %93 = and i32 %76, 1
  %94 = icmp eq i32 %93, 0
  %95 = select i1 %94, double %85, double %92
  %96 = bitcast double %95 to <2 x i32>
  %97 = shl i32 %76, 30
  %98 = bitcast double %64 to <2 x i32>
  %99 = extractelement <2 x i32> %98, i64 1
  %100 = xor i32 %97, %99
  %101 = and i32 %100, -2147483648
  %102 = extractelement <2 x i32> %96, i64 1
  %103 = xor i32 %102, %101
  %104 = insertelement <2 x i32> %96, i32 %103, i64 1
  %105 = tail call i1 @llvm.amdgcn.class.f64(double %64, i32 519)
  %106 = select i1 %105, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %104
  %107 = bitcast <2 x i32> %106 to double
  %108 = fmul contract double %19, %107
  %109 = fadd contract double %108, %20
  %110 = fptrunc double %109 to float
  %111 = add nsw i32 %24, %4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  store float %110, float addrspace(1)* %113, align 4, !tbaa !7
  %114 = add nuw nsw i32 %25, 1
  %115 = mul i32 %114, %13
  %116 = add i32 %115, %16
  %117 = icmp ult i32 %116, %3
  br i1 %117, label %23, label %34, !llvm.loop !13

118:                                              ; preds = %118, %32
  %119 = phi i32 [ 0, %32 ], [ %169, %118 ]
  %120 = phi float [ 0.000000e+00, %32 ], [ %168, %118 ]
  %121 = phi i32 [ 0, %32 ], [ %170, %118 ]
  %122 = add nsw i32 %119, %4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = fadd contract float %120, %125
  %127 = or i32 %119, 1
  %128 = add nsw i32 %127, %4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fadd contract float %126, %131
  %133 = or i32 %119, 2
  %134 = add nsw i32 %133, %4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7
  %138 = fadd contract float %132, %137
  %139 = or i32 %119, 3
  %140 = add nsw i32 %139, %4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = fadd contract float %138, %143
  %145 = or i32 %119, 4
  %146 = add nsw i32 %145, %4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = fadd contract float %144, %149
  %151 = or i32 %119, 5
  %152 = add nsw i32 %151, %4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = fadd contract float %150, %155
  %157 = or i32 %119, 6
  %158 = add nsw i32 %157, %4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = fadd contract float %156, %161
  %163 = or i32 %119, 7
  %164 = add nsw i32 %163, %4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %1, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %168 = fadd contract float %162, %167
  %169 = add nuw nsw i32 %119, 8
  %170 = add i32 %121, 8
  %171 = icmp eq i32 %170, %33
  br i1 %171, label %43, label %118, !llvm.loop !15

172:                                              ; preds = %172, %41
  %173 = phi i32 [ 0, %41 ], [ %230, %172 ]
  %174 = phi i32 [ 0, %41 ], [ %231, %172 ]
  %175 = add nsw i32 %173, %3
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  %179 = zext i32 %173 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  store float %178, float addrspace(1)* %180, align 4, !tbaa !7
  %181 = add i32 %173, %4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %0, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = add i32 %181, %3
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %186
  store float %184, float addrspace(1)* %187, align 4, !tbaa !7
  %188 = or i32 %173, 1
  %189 = add nsw i32 %188, %3
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7
  %193 = zext i32 %188 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %0, i64 %193
  store float %192, float addrspace(1)* %194, align 4, !tbaa !7
  %195 = add i32 %188, %4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %0, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7
  %199 = add i32 %195, %3
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %0, i64 %200
  store float %198, float addrspace(1)* %201, align 4, !tbaa !7
  %202 = or i32 %173, 2
  %203 = add nsw i32 %202, %3
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7
  %207 = zext i32 %202 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %0, i64 %207
  store float %206, float addrspace(1)* %208, align 4, !tbaa !7
  %209 = add i32 %202, %4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %0, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !7
  %213 = add i32 %209, %3
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %0, i64 %214
  store float %212, float addrspace(1)* %215, align 4, !tbaa !7
  %216 = or i32 %173, 3
  %217 = add nsw i32 %216, %3
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %221 = zext i32 %216 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  store float %220, float addrspace(1)* %222, align 4, !tbaa !7
  %223 = add i32 %216, %4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %0, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = add i32 %223, %3
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %0, i64 %228
  store float %226, float addrspace(1)* %229, align 4, !tbaa !7
  %230 = add nuw nsw i32 %173, 4
  %231 = add i32 %174, 4
  %232 = icmp eq i32 %231, %42
  br i1 %232, label %233, label %172, !llvm.loop !16

233:                                              ; preds = %172, %38
  %234 = phi i32 [ 0, %38 ], [ %230, %172 ]
  %235 = icmp eq i32 %39, 0
  br i1 %235, label %255, label %236

236:                                              ; preds = %233, %236
  %237 = phi i32 [ %252, %236 ], [ %234, %233 ]
  %238 = phi i32 [ %253, %236 ], [ 0, %233 ]
  %239 = add nsw i32 %237, %3
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %0, i64 %240
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !7
  %243 = zext i32 %237 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %0, i64 %243
  store float %242, float addrspace(1)* %244, align 4, !tbaa !7
  %245 = add i32 %237, %4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !7
  %249 = add i32 %245, %3
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds float, float addrspace(1)* %0, i64 %250
  store float %248, float addrspace(1)* %251, align 4, !tbaa !7
  %252 = add nuw nsw i32 %237, 1
  %253 = add i32 %238, 1
  %254 = icmp eq i32 %253, %39
  br i1 %254, label %255, label %236, !llvm.loop !17

255:                                              ; preds = %233, %236, %34
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !12}
