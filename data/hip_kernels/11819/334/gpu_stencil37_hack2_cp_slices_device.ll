; ModuleID = '../data/hip_kernels/11819/334/main.cu'
source_filename = "../data/hip_kernels/11819/334/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29gpu_stencil37_hack2_cp_slicesPdS_S_S_iiiiiiiiiiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %18 = mul i32 %17, %15
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = mul i32 %19, %14
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = mul i32 %26, %25
  %28 = mul nsw i32 %5, %4
  %29 = mul nsw i32 %8, %7
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %31 = add i32 %27, %30
  %32 = icmp sge i32 %31, %11
  %33 = icmp sgt i32 %14, 0
  br i1 %33, label %34, label %74

34:                                               ; preds = %16
  %35 = add nsw i32 %18, 1
  %36 = icmp sge i32 %35, %12
  %37 = mul nsw i32 %18, %28
  %38 = shl i32 %17, 1
  %39 = mul i32 %38, %29
  %40 = add i32 %31, %39
  %41 = add i32 %31, %37
  %42 = select i1 %36, i1 true, i1 %32
  %43 = and i32 %14, 1
  %44 = icmp eq i32 %14, 1
  br i1 %44, label %47, label %45

45:                                               ; preds = %34
  %46 = and i32 %14, -2
  br label %75

47:                                               ; preds = %126, %34
  %48 = phi i32 [ 0, %34 ], [ %127, %126 ]
  %49 = icmp eq i32 %43, 0
  br i1 %49, label %74, label %50

50:                                               ; preds = %47
  %51 = add i32 %48, %20
  %52 = icmp sge i32 %51, %10
  %53 = mul nsw i32 %51, %7
  %54 = add i32 %40, %53
  %55 = mul i32 %51, %4
  %56 = add i32 %41, %55
  %57 = select i1 %32, i1 true, i1 %52
  br i1 %57, label %64, label %58

58:                                               ; preds = %50
  %59 = sext i32 %56 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7
  %62 = sext i32 %54 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %3, i64 %62
  store double %61, double addrspace(1)* %63, align 8, !tbaa !7
  br label %64

64:                                               ; preds = %58, %50
  %65 = select i1 %42, i1 true, i1 %52
  br i1 %65, label %74, label %66

66:                                               ; preds = %64
  %67 = add nsw i32 %56, %28
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %0, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = add nsw i32 %54, %29
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %3, i64 %72
  store double %70, double addrspace(1)* %73, align 8, !tbaa !7
  br label %74

74:                                               ; preds = %47, %66, %64, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

75:                                               ; preds = %126, %45
  %76 = phi i32 [ 0, %45 ], [ %127, %126 ]
  %77 = phi i32 [ 0, %45 ], [ %128, %126 ]
  %78 = add i32 %76, %20
  %79 = icmp sge i32 %78, %10
  %80 = mul nsw i32 %78, %7
  %81 = add i32 %40, %80
  %82 = mul i32 %78, %4
  %83 = add i32 %41, %82
  %84 = select i1 %32, i1 true, i1 %79
  br i1 %84, label %91, label %85

85:                                               ; preds = %75
  %86 = sext i32 %83 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7
  %89 = sext i32 %81 to i64
  %90 = getelementptr inbounds double, double addrspace(1)* %3, i64 %89
  store double %88, double addrspace(1)* %90, align 8, !tbaa !7
  br label %91

91:                                               ; preds = %75, %85
  %92 = select i1 %42, i1 true, i1 %79
  br i1 %92, label %101, label %93

93:                                               ; preds = %91
  %94 = add nsw i32 %83, %28
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %0, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7
  %98 = add nsw i32 %81, %29
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %3, i64 %99
  store double %97, double addrspace(1)* %100, align 8, !tbaa !7
  br label %101

101:                                              ; preds = %91, %93
  %102 = or i32 %76, 1
  %103 = add i32 %102, %20
  %104 = icmp sge i32 %103, %10
  %105 = mul nsw i32 %103, %7
  %106 = add i32 %40, %105
  %107 = mul i32 %103, %4
  %108 = add i32 %41, %107
  %109 = select i1 %32, i1 true, i1 %104
  br i1 %109, label %116, label %110

110:                                              ; preds = %101
  %111 = sext i32 %108 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %0, i64 %111
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !7
  %114 = sext i32 %106 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %3, i64 %114
  store double %113, double addrspace(1)* %115, align 8, !tbaa !7
  br label %116

116:                                              ; preds = %110, %101
  %117 = select i1 %42, i1 true, i1 %104
  br i1 %117, label %126, label %118

118:                                              ; preds = %116
  %119 = add nsw i32 %108, %28
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds double, double addrspace(1)* %0, i64 %120
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %123 = add nsw i32 %106, %29
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %3, i64 %124
  store double %122, double addrspace(1)* %125, align 8, !tbaa !7
  br label %126

126:                                              ; preds = %118, %116
  %127 = add nuw nsw i32 %76, 2
  %128 = add i32 %77, 2
  %129 = icmp eq i32 %128, %46
  br i1 %129, label %47, label %75, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
