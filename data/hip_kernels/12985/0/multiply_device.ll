; ModuleID = '../data/hip_kernels/12985/0/main.cu'
source_filename = "../data/hip_kernels/12985/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8multiplyPfS_S_iiE1A = internal unnamed_addr addrspace(3) global float* undef, align 8
@_ZZ8multiplyPfS_S_iiE1B = internal unnamed_addr addrspace(3) global float* undef, align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8multiplyPfS_S_ii(float addrspace(1)* %0, float addrspace(1)* %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = addrspacecast float addrspace(1)* %0 to float*
  %7 = addrspacecast float addrspace(1)* %1 to float*
  store float* %6, float* addrspace(3)* @_ZZ8multiplyPfS_S_iiE1A, align 8, !tbaa !4
  store float* %7, float* addrspace(3)* @_ZZ8multiplyPfS_S_iiE1B, align 8, !tbaa !4
  %8 = mul nsw i32 %3, %3
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !8, !invariant.load !9
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %17 = add i32 %15, %16
  %18 = mul i32 %17, %8
  %19 = udiv i32 %18, %4
  %20 = add nsw i32 %4, -1
  %21 = icmp eq i32 %17, %20
  br i1 %21, label %26, label %22

22:                                               ; preds = %5
  %23 = add i32 %17, 1
  %24 = mul i32 %23, %8
  %25 = udiv i32 %24, %4
  br label %26

26:                                               ; preds = %5, %22
  %27 = phi i32 [ %25, %22 ], [ %8, %5 ]
  %28 = freeze i32 %19
  %29 = icmp slt i32 %28, %27
  br i1 %29, label %30, label %198

30:                                               ; preds = %26
  %31 = icmp sgt i32 %3, 0
  %32 = and i32 %3, 7
  %33 = icmp ult i32 %3, 8
  %34 = and i32 %3, -8
  %35 = icmp eq i32 %32, 0
  br label %36

36:                                               ; preds = %30, %192
  %37 = phi i32 [ %28, %30 ], [ %196, %192 ]
  br i1 %31, label %38, label %192

38:                                               ; preds = %36
  %39 = srem i32 %37, %3
  %40 = sub i32 %37, %39
  br i1 %33, label %167, label %41

41:                                               ; preds = %38, %41
  %42 = phi float [ %163, %41 ], [ 0.000000e+00, %38 ]
  %43 = phi i32 [ %164, %41 ], [ 0, %38 ]
  %44 = phi i32 [ %165, %41 ], [ 0, %38 ]
  %45 = add nsw i32 %40, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = addrspacecast float addrspace(1)* %47 to float*
  %49 = load float, float* %48, align 4, !tbaa !11
  %50 = mul nsw i32 %43, %3
  %51 = add nsw i32 %50, %37
  %52 = sub i32 %51, %40
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = addrspacecast float addrspace(1)* %54 to float*
  %56 = load float, float* %55, align 4, !tbaa !11
  %57 = fmul contract float %49, %56
  %58 = fadd contract float %42, %57
  %59 = or i32 %43, 1
  %60 = add nsw i32 %40, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = addrspacecast float addrspace(1)* %62 to float*
  %64 = load float, float* %63, align 4, !tbaa !11
  %65 = mul nsw i32 %59, %3
  %66 = add nsw i32 %65, %37
  %67 = sub i32 %66, %40
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = addrspacecast float addrspace(1)* %69 to float*
  %71 = load float, float* %70, align 4, !tbaa !11
  %72 = fmul contract float %64, %71
  %73 = fadd contract float %58, %72
  %74 = or i32 %43, 2
  %75 = add nsw i32 %40, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = addrspacecast float addrspace(1)* %77 to float*
  %79 = load float, float* %78, align 4, !tbaa !11
  %80 = mul nsw i32 %74, %3
  %81 = add nsw i32 %80, %37
  %82 = sub i32 %81, %40
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = addrspacecast float addrspace(1)* %84 to float*
  %86 = load float, float* %85, align 4, !tbaa !11
  %87 = fmul contract float %79, %86
  %88 = fadd contract float %73, %87
  %89 = or i32 %43, 3
  %90 = add nsw i32 %40, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = addrspacecast float addrspace(1)* %92 to float*
  %94 = load float, float* %93, align 4, !tbaa !11
  %95 = mul nsw i32 %89, %3
  %96 = add nsw i32 %95, %37
  %97 = sub i32 %96, %40
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = addrspacecast float addrspace(1)* %99 to float*
  %101 = load float, float* %100, align 4, !tbaa !11
  %102 = fmul contract float %94, %101
  %103 = fadd contract float %88, %102
  %104 = or i32 %43, 4
  %105 = add nsw i32 %40, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = addrspacecast float addrspace(1)* %107 to float*
  %109 = load float, float* %108, align 4, !tbaa !11
  %110 = mul nsw i32 %104, %3
  %111 = add nsw i32 %110, %37
  %112 = sub i32 %111, %40
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = addrspacecast float addrspace(1)* %114 to float*
  %116 = load float, float* %115, align 4, !tbaa !11
  %117 = fmul contract float %109, %116
  %118 = fadd contract float %103, %117
  %119 = or i32 %43, 5
  %120 = add nsw i32 %40, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = addrspacecast float addrspace(1)* %122 to float*
  %124 = load float, float* %123, align 4, !tbaa !11
  %125 = mul nsw i32 %119, %3
  %126 = add nsw i32 %125, %37
  %127 = sub i32 %126, %40
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = addrspacecast float addrspace(1)* %129 to float*
  %131 = load float, float* %130, align 4, !tbaa !11
  %132 = fmul contract float %124, %131
  %133 = fadd contract float %118, %132
  %134 = or i32 %43, 6
  %135 = add nsw i32 %40, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = addrspacecast float addrspace(1)* %137 to float*
  %139 = load float, float* %138, align 4, !tbaa !11
  %140 = mul nsw i32 %134, %3
  %141 = add nsw i32 %140, %37
  %142 = sub i32 %141, %40
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = addrspacecast float addrspace(1)* %144 to float*
  %146 = load float, float* %145, align 4, !tbaa !11
  %147 = fmul contract float %139, %146
  %148 = fadd contract float %133, %147
  %149 = or i32 %43, 7
  %150 = add nsw i32 %40, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = addrspacecast float addrspace(1)* %152 to float*
  %154 = load float, float* %153, align 4, !tbaa !11
  %155 = mul nsw i32 %149, %3
  %156 = add nsw i32 %155, %37
  %157 = sub i32 %156, %40
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = addrspacecast float addrspace(1)* %159 to float*
  %161 = load float, float* %160, align 4, !tbaa !11
  %162 = fmul contract float %154, %161
  %163 = fadd contract float %148, %162
  %164 = add nuw nsw i32 %43, 8
  %165 = add i32 %44, 8
  %166 = icmp eq i32 %165, %34
  br i1 %166, label %167, label %41, !llvm.loop !13

167:                                              ; preds = %41, %38
  %168 = phi float [ undef, %38 ], [ %163, %41 ]
  %169 = phi float [ 0.000000e+00, %38 ], [ %163, %41 ]
  %170 = phi i32 [ 0, %38 ], [ %164, %41 ]
  br i1 %35, label %192, label %171

171:                                              ; preds = %167, %171
  %172 = phi float [ %188, %171 ], [ %169, %167 ]
  %173 = phi i32 [ %189, %171 ], [ %170, %167 ]
  %174 = phi i32 [ %190, %171 ], [ 0, %167 ]
  %175 = add nsw i32 %40, %173
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %178 = addrspacecast float addrspace(1)* %177 to float*
  %179 = load float, float* %178, align 4, !tbaa !11
  %180 = mul nsw i32 %173, %3
  %181 = add nsw i32 %180, %37
  %182 = sub i32 %181, %40
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %183
  %185 = addrspacecast float addrspace(1)* %184 to float*
  %186 = load float, float* %185, align 4, !tbaa !11
  %187 = fmul contract float %179, %186
  %188 = fadd contract float %172, %187
  %189 = add nuw nsw i32 %173, 1
  %190 = add i32 %174, 1
  %191 = icmp eq i32 %190, %32
  br i1 %191, label %192, label %171, !llvm.loop !15

192:                                              ; preds = %167, %171, %36
  %193 = phi float [ 0.000000e+00, %36 ], [ %168, %167 ], [ %188, %171 ]
  %194 = sext i32 %37 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  store float %193, float addrspace(1)* %195, align 4, !tbaa !11
  %196 = add nsw i32 %37, 1
  %197 = icmp slt i32 %196, %27
  br i1 %197, label %36, label %198, !llvm.loop !17

198:                                              ; preds = %192, %26
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
