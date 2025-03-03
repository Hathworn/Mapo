; ModuleID = '../data/hip_kernels/13017/8/main.cu'
source_filename = "../data/hip_kernels/13017/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8d_MM_OPTPfS_S_iiiE6aBlock = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ8d_MM_OPTPfS_S_iiiE6bBlock = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8d_MM_OPTPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = shl nsw i32 %3, 4
  %19 = mul nsw i32 %18, %8
  %20 = add nsw i32 %19, %3
  %21 = shl nsw i32 %4, 4
  %22 = icmp sgt i32 %3, 0
  br i1 %22, label %23, label %63

23:                                               ; preds = %6
  %24 = shl nsw i32 %7, 4
  %25 = mul nsw i32 %10, %3
  %26 = add i32 %25, %9
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 %9
  %28 = mul nsw i32 %10, %4
  %29 = add i32 %28, %9
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 %10, i32 %9
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 0
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 0, i32 %9
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 1
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 1, i32 %9
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 2
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 2, i32 %9
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 3
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 3, i32 %9
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 4
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 4, i32 %9
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 5
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 5, i32 %9
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 6
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 6, i32 %9
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 7
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 7, i32 %9
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 8
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 8, i32 %9
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 9
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 9, i32 %9
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 10
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 10, i32 %9
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 11
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 11, i32 %9
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 12
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 12, i32 %9
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 13
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 13, i32 %9
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 14
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 14, i32 %9
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6aBlock, i32 0, i32 %10, i32 15
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8d_MM_OPTPfS_S_iiiE6bBlock, i32 0, i32 15, i32 %9
  br label %75

63:                                               ; preds = %75, %6
  %64 = phi float [ 0.000000e+00, %6 ], [ %150, %75 ]
  %65 = zext i16 %17 to i32
  %66 = mul i32 %8, %65
  %67 = zext i16 %14 to i32
  %68 = mul i32 %7, %67
  %69 = add i32 %66, %10
  %70 = add i32 %68, %9
  %71 = mul nsw i32 %69, %4
  %72 = add nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  store float %64, float addrspace(1)* %74, align 4, !tbaa !7
  ret void

75:                                               ; preds = %23, %75
  %76 = phi i32 [ %24, %23 ], [ %152, %75 ]
  %77 = phi i32 [ %19, %23 ], [ %151, %75 ]
  %78 = phi float [ 0.000000e+00, %23 ], [ %150, %75 ]
  %79 = add i32 %26, %77
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %82, float addrspace(3)* %27, align 4, !tbaa !7
  %83 = add i32 %29, %76
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %86, float addrspace(3)* %30, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = load float, float addrspace(3)* %31, align 16, !tbaa !7
  %88 = load float, float addrspace(3)* %32, align 4, !tbaa !7
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %78, %89
  %91 = load float, float addrspace(3)* %33, align 4, !tbaa !7
  %92 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %90, %93
  %95 = load float, float addrspace(3)* %35, align 8, !tbaa !7
  %96 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %94, %97
  %99 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %100 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %98, %101
  %103 = load float, float addrspace(3)* %39, align 16, !tbaa !7
  %104 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %108 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %43, align 8, !tbaa !7
  %112 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %116 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %47, align 16, !tbaa !7
  %120 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %124 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %51, align 8, !tbaa !7
  %128 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %132 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %55, align 16, !tbaa !7
  %136 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %140 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %59, align 8, !tbaa !7
  %144 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %148 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = add nsw i32 %77, 16
  %152 = add nsw i32 %76, %21
  %153 = icmp slt i32 %151, %20
  br i1 %153, label %75, label %63, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
