; ModuleID = '../data/hip_kernels/9229/0/main.cu'
source_filename = "../data/hip_kernels/9229/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4gemmPfS_S_iiiE2As = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ4gemmPfS_S_iiiE2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4gemmPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = shl nsw i32 %5, 4
  %12 = mul nsw i32 %11, %7
  %13 = shl nsw i32 %8, 4
  %14 = add nsw i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  %17 = sdiv i32 %4, 16
  %18 = icmp sgt i32 %4, 15
  br i1 %18, label %19, label %63

19:                                               ; preds = %6
  %20 = mul i32 %7, %4
  %21 = mul nsw i32 %9, %4
  %22 = add nsw i32 %21, %10
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 %10
  %25 = mul nsw i32 %9, %5
  %26 = add nsw i32 %25, %10
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 %9, i32 %10
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 0
  %30 = getelementptr float, float addrspace(1)* %0, i64 %23
  %31 = getelementptr float, float addrspace(1)* %1, i64 %27
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 0, i32 %10
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 1
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 1, i32 %10
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 2
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 2, i32 %10
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 3
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 3, i32 %10
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 4
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 4, i32 %10
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 5
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 5, i32 %10
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 6
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 6, i32 %10
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 7
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 7, i32 %10
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 8
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 8, i32 %10
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 9
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 9, i32 %10
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 10
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 10, i32 %10
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 11
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 11, i32 %10
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 12
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 12, i32 %10
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 13
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 13, i32 %10
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 14
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 14, i32 %10
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2As, i32 0, i32 %9, i32 15
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ4gemmPfS_S_iiiE2Bs, i32 0, i32 15, i32 %10
  br label %67

63:                                               ; preds = %67, %6
  %64 = phi float [ 0.000000e+00, %6 ], [ %143, %67 ]
  %65 = add nsw i32 %13, %10
  %66 = icmp slt i32 %65, %5
  br i1 %66, label %146, label %155

67:                                               ; preds = %19, %67
  %68 = phi float [ 0.000000e+00, %19 ], [ %143, %67 ]
  %69 = phi i32 [ 0, %19 ], [ %144, %67 ]
  %70 = add i32 %69, %20
  %71 = shl i32 %70, 4
  %72 = sext i32 %71 to i64
  %73 = mul nsw i32 %69, %11
  %74 = add nsw i32 %73, %13
  %75 = sext i32 %74 to i64
  %76 = getelementptr float, float addrspace(1)* %30, i64 %72
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %77, float addrspace(3)* %24, align 4, !tbaa !5
  %78 = getelementptr float, float addrspace(1)* %31, i64 %75
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %79, float addrspace(3)* %28, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = load float, float addrspace(3)* %29, align 16, !tbaa !5
  %81 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %82 = fmul contract float %80, %81
  %83 = fadd contract float %68, %82
  %84 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %85 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %86 = fmul contract float %84, %85
  %87 = fadd contract float %83, %86
  %88 = load float, float addrspace(3)* %35, align 8, !tbaa !5
  %89 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %87, %90
  %92 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %93 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %94 = fmul contract float %92, %93
  %95 = fadd contract float %91, %94
  %96 = load float, float addrspace(3)* %39, align 16, !tbaa !5
  %97 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %98 = fmul contract float %96, %97
  %99 = fadd contract float %95, %98
  %100 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %101 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %102 = fmul contract float %100, %101
  %103 = fadd contract float %99, %102
  %104 = load float, float addrspace(3)* %43, align 8, !tbaa !5
  %105 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %106 = fmul contract float %104, %105
  %107 = fadd contract float %103, %106
  %108 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %109 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %107, %110
  %112 = load float, float addrspace(3)* %47, align 16, !tbaa !5
  %113 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  %116 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %117 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %51, align 8, !tbaa !5
  %121 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %125 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %55, align 16, !tbaa !5
  %129 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %133 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %59, align 8, !tbaa !5
  %137 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %141 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %144 = add nuw nsw i32 %69, 1
  %145 = icmp eq i32 %144, %17
  br i1 %145, label %63, label %67, !llvm.loop !10

146:                                              ; preds = %63
  %147 = shl nsw i32 %7, 4
  %148 = add nsw i32 %147, %9
  %149 = icmp slt i32 %148, %3
  br i1 %149, label %150, label %155

150:                                              ; preds = %146
  %151 = mul nsw i32 %9, %5
  %152 = add nsw i32 %151, %10
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %16, i64 %153
  store float %64, float addrspace(1)* %154, align 4, !tbaa !5
  br label %155

155:                                              ; preds = %150, %146, %63
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
