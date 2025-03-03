; ModuleID = '../data/hip_kernels/11819/198/main.cu'
source_filename = "../data/hip_kernels/11819/198/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29gpu_stencil37_hack1_cp_slicesPdS_S_S_iiiiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = mul i32 %13, %8
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %19
  %22 = mul nsw i32 %5, %4
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %21, %23
  %25 = icmp sge i32 %24, %5
  %26 = icmp sgt i32 %8, 0
  br i1 %26, label %27, label %66

27:                                               ; preds = %10
  %28 = add nsw i32 %12, 1
  %29 = icmp sge i32 %28, %6
  %30 = mul nsw i32 %12, %22
  %31 = shl i32 %11, 1
  %32 = mul i32 %31, %22
  %33 = add i32 %24, %32
  %34 = add i32 %24, %30
  %35 = select i1 %29, i1 true, i1 %25
  %36 = and i32 %8, 1
  %37 = icmp eq i32 %8, 1
  br i1 %37, label %40, label %38

38:                                               ; preds = %27
  %39 = and i32 %8, -2
  br label %67

40:                                               ; preds = %116, %27
  %41 = phi i32 [ 0, %27 ], [ %117, %116 ]
  %42 = icmp eq i32 %36, 0
  br i1 %42, label %66, label %43

43:                                               ; preds = %40
  %44 = add i32 %41, %14
  %45 = icmp sge i32 %44, %4
  %46 = mul i32 %44, %5
  %47 = add i32 %33, %46
  %48 = add i32 %34, %46
  %49 = select i1 %25, i1 true, i1 %45
  br i1 %49, label %56, label %50

50:                                               ; preds = %43
  %51 = sext i32 %48 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7
  %54 = sext i32 %47 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %3, i64 %54
  store double %53, double addrspace(1)* %55, align 8, !tbaa !7
  br label %56

56:                                               ; preds = %50, %43
  %57 = select i1 %35, i1 true, i1 %45
  br i1 %57, label %66, label %58

58:                                               ; preds = %56
  %59 = add nsw i32 %48, %22
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7
  %63 = add nsw i32 %47, %22
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %3, i64 %64
  store double %62, double addrspace(1)* %65, align 8, !tbaa !7
  br label %66

66:                                               ; preds = %40, %58, %56, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

67:                                               ; preds = %116, %38
  %68 = phi i32 [ 0, %38 ], [ %117, %116 ]
  %69 = phi i32 [ 0, %38 ], [ %118, %116 ]
  %70 = add i32 %68, %14
  %71 = icmp sge i32 %70, %4
  %72 = mul i32 %70, %5
  %73 = add i32 %33, %72
  %74 = add i32 %34, %72
  %75 = select i1 %25, i1 true, i1 %71
  br i1 %75, label %82, label %76

76:                                               ; preds = %67
  %77 = sext i32 %74 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %0, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7
  %80 = sext i32 %73 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %3, i64 %80
  store double %79, double addrspace(1)* %81, align 8, !tbaa !7
  br label %82

82:                                               ; preds = %67, %76
  %83 = select i1 %35, i1 true, i1 %71
  br i1 %83, label %92, label %84

84:                                               ; preds = %82
  %85 = add nsw i32 %74, %22
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7
  %89 = add nsw i32 %73, %22
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %3, i64 %90
  store double %88, double addrspace(1)* %91, align 8, !tbaa !7
  br label %92

92:                                               ; preds = %82, %84
  %93 = or i32 %68, 1
  %94 = add i32 %93, %14
  %95 = icmp sge i32 %94, %4
  %96 = mul i32 %94, %5
  %97 = add i32 %33, %96
  %98 = add i32 %34, %96
  %99 = select i1 %25, i1 true, i1 %95
  br i1 %99, label %106, label %100

100:                                              ; preds = %92
  %101 = sext i32 %98 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %0, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7
  %104 = sext i32 %97 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %3, i64 %104
  store double %103, double addrspace(1)* %105, align 8, !tbaa !7
  br label %106

106:                                              ; preds = %100, %92
  %107 = select i1 %35, i1 true, i1 %95
  br i1 %107, label %116, label %108

108:                                              ; preds = %106
  %109 = add nsw i32 %98, %22
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %0, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7
  %113 = add nsw i32 %97, %22
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %3, i64 %114
  store double %112, double addrspace(1)* %115, align 8, !tbaa !7
  br label %116

116:                                              ; preds = %108, %106
  %117 = add nuw nsw i32 %68, 2
  %118 = add i32 %69, 2
  %119 = icmp eq i32 %118, %39
  br i1 %119, label %40, label %67, !llvm.loop !11
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
