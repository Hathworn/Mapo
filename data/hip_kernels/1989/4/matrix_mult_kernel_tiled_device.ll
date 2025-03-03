; ModuleID = '../data/hip_kernels/1989/4/main.cu'
source_filename = "../data/hip_kernels/1989/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24matrix_mult_kernel_tiledPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl nsw i32 %10, 4
  %12 = add nsw i32 %11, %8
  %13 = shl nsw i32 %9, 4
  %14 = add nsw i32 %13, %7
  %15 = sitofp i32 %5 to float
  %16 = fmul contract float %15, 6.250000e-02
  %17 = tail call float @llvm.ceil.f32(float %16)
  %18 = fcmp contract ogt float %17, 0.000000e+00
  br i1 %18, label %19, label %57

19:                                               ; preds = %6
  %20 = icmp slt i32 %12, %3
  %21 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 %7
  %22 = mul nsw i32 %12, %5
  %23 = icmp slt i32 %14, %4
  %24 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 %8, i32 %7
  %25 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 0
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 0, i32 %7
  %27 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 1
  %28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 1, i32 %7
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 2
  %30 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 2, i32 %7
  %31 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 3
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 3, i32 %7
  %33 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 4
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 4, i32 %7
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 5
  %36 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 5, i32 %7
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 6
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 6, i32 %7
  %39 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 7
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 7, i32 %7
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 8
  %42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 8, i32 %7
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 9
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 9, i32 %7
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 10
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 10, i32 %7
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 11
  %48 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 11, i32 %7
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 12
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 12, i32 %7
  %51 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 13
  %52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 13, i32 %7
  %53 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 14
  %54 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 14, i32 %7
  %55 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_m, i32 0, i32 %8, i32 15
  %56 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ24matrix_mult_kernel_tiledPiS_S_iiiE4ds_n, i32 0, i32 15, i32 %7
  br label %62

57:                                               ; preds = %86, %6
  %58 = phi i32 [ 0, %6 ], [ %151, %86 ]
  %59 = icmp slt i32 %12, %3
  %60 = icmp slt i32 %14, %4
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %155, label %160

62:                                               ; preds = %19, %86
  %63 = phi i32 [ 0, %19 ], [ %152, %86 ]
  %64 = phi i32 [ 0, %19 ], [ %151, %86 ]
  br i1 %20, label %65, label %74

65:                                               ; preds = %62
  %66 = shl nsw i32 %63, 4
  %67 = add nuw i32 %66, %7
  %68 = icmp slt i32 %67, %5
  br i1 %68, label %69, label %74

69:                                               ; preds = %65
  %70 = add i32 %67, %22
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %74

74:                                               ; preds = %62, %65, %69
  %75 = phi i32 [ %73, %69 ], [ 0, %65 ], [ 0, %62 ]
  store i32 %75, i32 addrspace(3)* %21, align 4, !tbaa !5
  br i1 %23, label %76, label %86

76:                                               ; preds = %74
  %77 = shl nsw i32 %63, 4
  %78 = add nuw nsw i32 %77, %8
  %79 = icmp slt i32 %78, %5
  br i1 %79, label %80, label %86

80:                                               ; preds = %76
  %81 = mul nsw i32 %78, %4
  %82 = add nsw i32 %81, %14
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %86

86:                                               ; preds = %74, %76, %80
  %87 = phi i32 [ %85, %80 ], [ 0, %76 ], [ 0, %74 ]
  store i32 %87, i32 addrspace(3)* %24, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = load i32, i32 addrspace(3)* %25, align 16, !tbaa !5
  %89 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %90 = mul nsw i32 %89, %88
  %91 = add nsw i32 %90, %64
  %92 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %93 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %94 = mul nsw i32 %93, %92
  %95 = add nsw i32 %94, %91
  %96 = load i32, i32 addrspace(3)* %29, align 8, !tbaa !5
  %97 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %98 = mul nsw i32 %97, %96
  %99 = add nsw i32 %98, %95
  %100 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %101 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %102 = mul nsw i32 %101, %100
  %103 = add nsw i32 %102, %99
  %104 = load i32, i32 addrspace(3)* %33, align 16, !tbaa !5
  %105 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %106 = mul nsw i32 %105, %104
  %107 = add nsw i32 %106, %103
  %108 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !5
  %109 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %110 = mul nsw i32 %109, %108
  %111 = add nsw i32 %110, %107
  %112 = load i32, i32 addrspace(3)* %37, align 8, !tbaa !5
  %113 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %114 = mul nsw i32 %113, %112
  %115 = add nsw i32 %114, %111
  %116 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %117 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %118 = mul nsw i32 %117, %116
  %119 = add nsw i32 %118, %115
  %120 = load i32, i32 addrspace(3)* %41, align 16, !tbaa !5
  %121 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %122 = mul nsw i32 %121, %120
  %123 = add nsw i32 %122, %119
  %124 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %125 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %126 = mul nsw i32 %125, %124
  %127 = add nsw i32 %126, %123
  %128 = load i32, i32 addrspace(3)* %45, align 8, !tbaa !5
  %129 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %130 = mul nsw i32 %129, %128
  %131 = add nsw i32 %130, %127
  %132 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !5
  %133 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %134 = mul nsw i32 %133, %132
  %135 = add nsw i32 %134, %131
  %136 = load i32, i32 addrspace(3)* %49, align 16, !tbaa !5
  %137 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %138 = mul nsw i32 %137, %136
  %139 = add nsw i32 %138, %135
  %140 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !5
  %141 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %142 = mul nsw i32 %141, %140
  %143 = add nsw i32 %142, %139
  %144 = load i32, i32 addrspace(3)* %53, align 8, !tbaa !5
  %145 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !5
  %146 = mul nsw i32 %145, %144
  %147 = add nsw i32 %146, %143
  %148 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !5
  %149 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !5
  %150 = mul nsw i32 %149, %148
  %151 = add nsw i32 %150, %147
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %152 = add nuw nsw i32 %63, 1
  %153 = sitofp i32 %152 to float
  %154 = fcmp contract ogt float %17, %153
  br i1 %154, label %62, label %57, !llvm.loop !10

155:                                              ; preds = %57
  %156 = mul nsw i32 %12, %4
  %157 = add nsw i32 %156, %14
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %158
  store i32 %58, i32 addrspace(1)* %159, align 4, !tbaa !5
  br label %160

160:                                              ; preds = %155, %57
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
