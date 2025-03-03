; ModuleID = '../data/hip_kernels/2327/1/main.cu'
source_filename = "../data/hip_kernels/2327/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14mat_mul_sharedPiS_S_iiiiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = shl nsw i32 %10, 4
  %15 = add nsw i32 %14, %12
  %16 = shl nsw i32 %11, 4
  %17 = add nsw i32 %16, %13
  %18 = icmp sgt i32 %4, 0
  br i1 %18, label %19, label %59

19:                                               ; preds = %9
  %20 = add nuw nsw i32 %4, 15
  %21 = lshr i32 %20, 4
  %22 = icmp slt i32 %15, %3
  %23 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 %13
  %24 = mul nsw i32 %15, %4
  %25 = icmp slt i32 %17, %6
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 %12, i32 %13
  %27 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 0
  %28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 0, i32 %13
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 1
  %30 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 1, i32 %13
  %31 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 2
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 2, i32 %13
  %33 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 3
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 3, i32 %13
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 4
  %36 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 4, i32 %13
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 5
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 5, i32 %13
  %39 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 6
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 6, i32 %13
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 7
  %42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 7, i32 %13
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 8
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 8, i32 %13
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 9
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 9, i32 %13
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 10
  %48 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 10, i32 %13
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 11
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 11, i32 %13
  %51 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 12
  %52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 12, i32 %13
  %53 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 13
  %54 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 13, i32 %13
  %55 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 14
  %56 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 14, i32 %13
  %57 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_A, i32 0, i32 %12, i32 15
  %58 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ14mat_mul_sharedPiS_S_iiiiiiE3s_B, i32 0, i32 15, i32 %13
  br label %64

59:                                               ; preds = %87, %9
  %60 = phi i32 [ 0, %9 ], [ %152, %87 ]
  %61 = icmp slt i32 %15, %7
  %62 = icmp slt i32 %17, %8
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %155, label %160

64:                                               ; preds = %19, %87
  %65 = phi i32 [ 0, %19 ], [ %153, %87 ]
  %66 = phi i32 [ 0, %19 ], [ %152, %87 ]
  %67 = shl nsw i32 %65, 4
  br i1 %22, label %68, label %76

68:                                               ; preds = %64
  %69 = add nuw i32 %67, %13
  %70 = icmp slt i32 %69, %4
  br i1 %70, label %71, label %76

71:                                               ; preds = %68
  %72 = add i32 %69, %24
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %76

76:                                               ; preds = %68, %64, %71
  %77 = phi i32 [ %75, %71 ], [ 0, %64 ], [ 0, %68 ]
  store i32 %77, i32 addrspace(3)* %23, align 4, !tbaa !5
  %78 = add nuw nsw i32 %67, %12
  %79 = icmp slt i32 %78, %5
  %80 = select i1 %79, i1 %25, i1 false
  br i1 %80, label %81, label %87

81:                                               ; preds = %76
  %82 = mul nsw i32 %78, %6
  %83 = add nsw i32 %82, %17
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %87

87:                                               ; preds = %76, %81
  %88 = phi i32 [ %86, %81 ], [ 0, %76 ]
  store i32 %88, i32 addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = load i32, i32 addrspace(3)* %27, align 16, !tbaa !5
  %90 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %91 = mul nsw i32 %90, %89
  %92 = add nsw i32 %91, %66
  %93 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %94 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %95 = mul nsw i32 %94, %93
  %96 = add nsw i32 %95, %92
  %97 = load i32, i32 addrspace(3)* %31, align 8, !tbaa !5
  %98 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %99 = mul nsw i32 %98, %97
  %100 = add nsw i32 %99, %96
  %101 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !5
  %102 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %103 = mul nsw i32 %102, %101
  %104 = add nsw i32 %103, %100
  %105 = load i32, i32 addrspace(3)* %35, align 16, !tbaa !5
  %106 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %107 = mul nsw i32 %106, %105
  %108 = add nsw i32 %107, %104
  %109 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %110 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %111 = mul nsw i32 %110, %109
  %112 = add nsw i32 %111, %108
  %113 = load i32, i32 addrspace(3)* %39, align 8, !tbaa !5
  %114 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %115 = mul nsw i32 %114, %113
  %116 = add nsw i32 %115, %112
  %117 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %118 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %119 = mul nsw i32 %118, %117
  %120 = add nsw i32 %119, %116
  %121 = load i32, i32 addrspace(3)* %43, align 16, !tbaa !5
  %122 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %123 = mul nsw i32 %122, %121
  %124 = add nsw i32 %123, %120
  %125 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %126 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %127 = mul nsw i32 %126, %125
  %128 = add nsw i32 %127, %124
  %129 = load i32, i32 addrspace(3)* %47, align 8, !tbaa !5
  %130 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %131 = mul nsw i32 %130, %129
  %132 = add nsw i32 %131, %128
  %133 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %134 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %135 = mul nsw i32 %134, %133
  %136 = add nsw i32 %135, %132
  %137 = load i32, i32 addrspace(3)* %51, align 16, !tbaa !5
  %138 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %139 = mul nsw i32 %138, %137
  %140 = add nsw i32 %139, %136
  %141 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %142 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !5
  %143 = mul nsw i32 %142, %141
  %144 = add nsw i32 %143, %140
  %145 = load i32, i32 addrspace(3)* %55, align 8, !tbaa !5
  %146 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !5
  %147 = mul nsw i32 %146, %145
  %148 = add nsw i32 %147, %144
  %149 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %150 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !5
  %151 = mul nsw i32 %150, %149
  %152 = add nsw i32 %151, %148
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %153 = add nuw nsw i32 %65, 1
  %154 = icmp eq i32 %153, %21
  br i1 %154, label %59, label %64, !llvm.loop !10

155:                                              ; preds = %59
  %156 = mul nsw i32 %15, %8
  %157 = add nsw i32 %156, %17
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %158
  store i32 %60, i32 addrspace(1)* %159, align 4, !tbaa !5
  br label %160

160:                                              ; preds = %155, %59
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
