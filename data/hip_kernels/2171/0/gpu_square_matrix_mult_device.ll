; ModuleID = '../data/hip_kernels/2171/0/main.cu'
source_filename = "../data/hip_kernels/2171/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22gpu_square_matrix_multPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !5
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %67, label %27

27:                                               ; preds = %4
  %28 = mul nsw i32 %8, %3
  %29 = add i32 %28, %11
  %30 = mul nsw i32 %3, %3
  %31 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 %11
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 %7, i32 %11
  %33 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 0
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 0, i32 %11
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 1
  %36 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 1, i32 %11
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 2
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 2, i32 %11
  %39 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 3
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 3, i32 %11
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 4
  %42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 4, i32 %11
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 5
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 5, i32 %11
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 6
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 6, i32 %11
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 7
  %48 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 7, i32 %11
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 8
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 8, i32 %11
  %51 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 9
  %52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 9, i32 %11
  %53 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 10
  %54 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 10, i32 %11
  %55 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 11
  %56 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 11, i32 %11
  %57 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 12
  %58 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 12, i32 %11
  %59 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 13
  %60 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 13, i32 %11
  %61 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 14
  %62 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 14, i32 %11
  %63 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_a, i32 0, i32 %7, i32 15
  %64 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ22gpu_square_matrix_multPfS_S_iE6tile_b, i32 0, i32 15, i32 %11
  br label %72

65:                                               ; preds = %94
  %66 = sitofp i32 %159 to float
  br label %67

67:                                               ; preds = %65, %4
  %68 = phi float [ 0.000000e+00, %4 ], [ %66, %65 ]
  %69 = icmp slt i32 %8, %3
  %70 = icmp slt i32 %12, %3
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %162, label %167

72:                                               ; preds = %27, %94
  %73 = phi i32 [ 0, %27 ], [ %160, %94 ]
  %74 = phi i32 [ 0, %27 ], [ %159, %94 ]
  %75 = shl nsw i32 %73, 4
  %76 = add i32 %29, %75
  %77 = icmp slt i32 %76, %30
  br i1 %77, label %78, label %83

78:                                               ; preds = %72
  %79 = sext i32 %76 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !15
  %82 = fptosi float %81 to i32
  br label %83

83:                                               ; preds = %72, %78
  %84 = phi i32 [ %82, %78 ], [ 0, %72 ]
  store i32 %84, i32 addrspace(3)* %31, align 4, !tbaa !20
  %85 = add nuw i32 %75, %7
  %86 = mul i32 %85, %3
  %87 = add i32 %86, %12
  %88 = icmp slt i32 %87, %30
  br i1 %88, label %89, label %94

89:                                               ; preds = %83
  %90 = sext i32 %87 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !15
  %93 = fptosi float %92 to i32
  br label %94

94:                                               ; preds = %83, %89
  %95 = phi i32 [ %93, %89 ], [ 0, %83 ]
  store i32 %95, i32 addrspace(3)* %32, align 4, !tbaa !20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = load i32, i32 addrspace(3)* %33, align 16, !tbaa !20
  %97 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !20
  %98 = mul nsw i32 %97, %96
  %99 = add nsw i32 %98, %74
  %100 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !20
  %101 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !20
  %102 = mul nsw i32 %101, %100
  %103 = add nsw i32 %102, %99
  %104 = load i32, i32 addrspace(3)* %37, align 8, !tbaa !20
  %105 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !20
  %106 = mul nsw i32 %105, %104
  %107 = add nsw i32 %106, %103
  %108 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !20
  %109 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !20
  %110 = mul nsw i32 %109, %108
  %111 = add nsw i32 %110, %107
  %112 = load i32, i32 addrspace(3)* %41, align 16, !tbaa !20
  %113 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !20
  %114 = mul nsw i32 %113, %112
  %115 = add nsw i32 %114, %111
  %116 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !20
  %117 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !20
  %118 = mul nsw i32 %117, %116
  %119 = add nsw i32 %118, %115
  %120 = load i32, i32 addrspace(3)* %45, align 8, !tbaa !20
  %121 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !20
  %122 = mul nsw i32 %121, %120
  %123 = add nsw i32 %122, %119
  %124 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !20
  %125 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !20
  %126 = mul nsw i32 %125, %124
  %127 = add nsw i32 %126, %123
  %128 = load i32, i32 addrspace(3)* %49, align 16, !tbaa !20
  %129 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !20
  %130 = mul nsw i32 %129, %128
  %131 = add nsw i32 %130, %127
  %132 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !20
  %133 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !20
  %134 = mul nsw i32 %133, %132
  %135 = add nsw i32 %134, %131
  %136 = load i32, i32 addrspace(3)* %53, align 8, !tbaa !20
  %137 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !20
  %138 = mul nsw i32 %137, %136
  %139 = add nsw i32 %138, %135
  %140 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !20
  %141 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !20
  %142 = mul nsw i32 %141, %140
  %143 = add nsw i32 %142, %139
  %144 = load i32, i32 addrspace(3)* %57, align 16, !tbaa !20
  %145 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !20
  %146 = mul nsw i32 %145, %144
  %147 = add nsw i32 %146, %143
  %148 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !20
  %149 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !20
  %150 = mul nsw i32 %149, %148
  %151 = add nsw i32 %150, %147
  %152 = load i32, i32 addrspace(3)* %61, align 8, !tbaa !20
  %153 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !20
  %154 = mul nsw i32 %153, %152
  %155 = add nsw i32 %154, %151
  %156 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !20
  %157 = load i32, i32 addrspace(3)* %64, align 4, !tbaa !20
  %158 = mul nsw i32 %157, %156
  %159 = add nsw i32 %158, %155
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %160 = add nuw nsw i32 %73, 1
  %161 = icmp eq i32 %160, %25
  br i1 %161, label %65, label %72, !llvm.loop !22

162:                                              ; preds = %67
  %163 = mul nsw i32 %8, %3
  %164 = add nsw i32 %163, %12
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  store float %68, float addrspace(1)* %166, align 4, !tbaa !16
  br label %167

167:                                              ; preds = %162, %67
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
