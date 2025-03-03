; ModuleID = '../data/hip_kernels/8588/9/main.cu'
source_filename = "../data/hip_kernels/8588/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem = internal unnamed_addr addrspace(3) global [34 x [34 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z27sobelEdgeDetectionSharedMemPiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %23, %14
  %25 = add nuw nsw i32 %13, 1
  %26 = add nuw nsw i32 %21, 1
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %25, i32 %26
  store i32 %29, i32 addrspace(3)* %30, align 4, !tbaa !7
  %31 = icmp sgt i32 %14, 0
  %32 = icmp sgt i32 %22, 0
  %33 = select i1 %31, i1 %32, i1 false
  %34 = add nsw i32 %2, -1
  %35 = icmp slt i32 %14, %34
  %36 = select i1 %33, i1 %35, i1 false
  %37 = add nsw i32 %3, -1
  %38 = icmp slt i32 %22, %37
  %39 = select i1 %36, i1 %38, i1 false
  br i1 %39, label %40, label %116

40:                                               ; preds = %5
  %41 = icmp ne i32 %13, 0
  br i1 %41, label %48, label %42

42:                                               ; preds = %40
  %43 = add nsw i32 %24, -1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 0, i32 %26
  store i32 %46, i32 addrspace(3)* %47, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %42, %40
  %49 = icmp ne i32 %21, 0
  br i1 %49, label %58, label %50

50:                                               ; preds = %48
  %51 = add nsw i32 %22, -1
  %52 = mul nsw i32 %51, %2
  %53 = add nsw i32 %52, %14
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %25, i32 0
  store i32 %56, i32 addrspace(3)* %57, align 8, !tbaa !7
  br label %58

58:                                               ; preds = %50, %48
  %59 = icmp ne i32 %13, 33
  br i1 %59, label %66, label %60

60:                                               ; preds = %58
  %61 = add nsw i32 %24, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 35, i32 %26
  store i32 %64, i32 addrspace(3)* %65, align 4, !tbaa !7
  br label %66

66:                                               ; preds = %60, %58
  %67 = icmp ne i32 %21, 33
  br i1 %67, label %76, label %68

68:                                               ; preds = %66
  %69 = add nuw nsw i32 %22, 1
  %70 = mul nsw i32 %69, %2
  %71 = add nsw i32 %70, %14
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %25, i32 35
  store i32 %74, i32 addrspace(3)* %75, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %68, %66
  %77 = select i1 %41, i1 true, i1 %49
  br i1 %77, label %86, label %78

78:                                               ; preds = %76
  %79 = add nsw i32 %22, -1
  %80 = mul nsw i32 %79, %2
  %81 = add nsw i32 %14, -1
  %82 = add i32 %81, %80
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %85, i32 addrspace(3)* getelementptr inbounds ([34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 0, i32 0), align 16, !tbaa !7
  br label %86

86:                                               ; preds = %76, %78
  %87 = select i1 %59, i1 true, i1 %49
  br i1 %87, label %96, label %88

88:                                               ; preds = %86
  %89 = add nsw i32 %22, -1
  %90 = mul nsw i32 %89, %2
  %91 = add nuw nsw i32 %14, 1
  %92 = add i32 %91, %90
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %95, i32 addrspace(3)* getelementptr ([34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 1, i32 1, i32 0), align 8, !tbaa !7
  br label %96

96:                                               ; preds = %86, %88
  %97 = select i1 %41, i1 true, i1 %67
  br i1 %97, label %106, label %98

98:                                               ; preds = %96
  %99 = add nuw nsw i32 %22, 1
  %100 = mul nsw i32 %99, %2
  %101 = add nsw i32 %14, -1
  %102 = add i32 %101, %100
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %105, i32 addrspace(3)* getelementptr inbounds ([34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 1, i32 1), align 4, !tbaa !7
  br label %106

106:                                              ; preds = %96, %98
  %107 = select i1 %59, i1 true, i1 %67
  br i1 %107, label %116, label %108

108:                                              ; preds = %106
  %109 = add nuw nsw i32 %22, 1
  %110 = mul nsw i32 %109, %2
  %111 = add nuw nsw i32 %14, 1
  %112 = add i32 %111, %110
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %115, i32 addrspace(3)* getelementptr ([34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 1, i32 2, i32 1), align 4, !tbaa !7
  br label %116

116:                                              ; preds = %106, %108, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = add nuw nsw i32 %13, 2
  %118 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %117, i32 %21
  %119 = load i32, i32 addrspace(3)* %118, align 4, !tbaa !7
  %120 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %13, i32 %21
  %121 = load i32, i32 addrspace(3)* %120, align 4, !tbaa !7
  %122 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %117, i32 %26
  %123 = load i32, i32 addrspace(3)* %122, align 4, !tbaa !7
  %124 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %13, i32 %26
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !7
  %126 = add nuw nsw i32 %21, 2
  %127 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %117, i32 %126
  %128 = load i32, i32 addrspace(3)* %127, align 4, !tbaa !7
  %129 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %13, i32 %126
  %130 = load i32, i32 addrspace(3)* %129, align 4, !tbaa !7
  %131 = sub i32 %123, %125
  %132 = shl i32 %131, 1
  %133 = add i32 %119, %128
  %134 = add i32 %121, %130
  %135 = sub i32 %133, %134
  %136 = add i32 %135, %132
  %137 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %25, i32 %21
  %138 = load i32, i32 addrspace(3)* %137, align 4, !tbaa !7
  %139 = getelementptr inbounds [34 x [34 x i32]], [34 x [34 x i32]] addrspace(3)* @_ZZ27sobelEdgeDetectionSharedMemPiS_iiiE5shMem, i32 0, i32 %25, i32 %126
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !7
  %141 = sub i32 %138, %140
  %142 = shl i32 %141, 1
  %143 = add i32 %121, %119
  %144 = add i32 %128, %130
  %145 = sub i32 %143, %144
  %146 = add i32 %145, %142
  %147 = mul nsw i32 %136, %136
  %148 = mul nsw i32 %146, %146
  %149 = add nuw nsw i32 %148, %147
  %150 = icmp sgt i32 %149, %4
  %151 = select i1 %150, i32 255, i32 0
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  store i32 %151, i32 addrspace(1)* %152, align 4
  ret void
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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
