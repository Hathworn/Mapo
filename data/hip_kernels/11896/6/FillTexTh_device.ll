; ModuleID = '../data/hip_kernels/11896/6/main.cu'
source_filename = "../data/hip_kernels/11896/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9FillTexThPviimPdiii(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i64 %3, double addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %1
  %27 = icmp slt i32 %25, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %83

29:                                               ; preds = %8
  %30 = mul nsw i32 %25, %1
  %31 = add nsw i32 %30, %17
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %4, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !5
  %35 = fcmp contract olt double %34, 0.000000e+00
  %36 = select i1 %35, double 0.000000e+00, double %34
  %37 = sext i32 %25 to i64
  %38 = mul i64 %37, %3
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = shl nsw i32 %17, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %39, i64 %41
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 3
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !11, !amdgpu.noclobber !5
  %45 = zext i8 %44 to i32
  %46 = icmp slt i32 %45, %6
  br i1 %46, label %47, label %50

47:                                               ; preds = %29
  %48 = and i32 %5, 1
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %67, label %65

50:                                               ; preds = %29
  %51 = fcmp contract ogt double %36, 2.530000e+02
  %52 = select i1 %51, double 2.530000e+02, double %36
  %53 = fptoui double %52 to i8
  %54 = and i32 %5, 1
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %57, label %56

56:                                               ; preds = %50
  store i8 %53, i8 addrspace(1)* %42, align 1, !tbaa !11
  br label %57

57:                                               ; preds = %50, %56
  %58 = and i32 %5, 2
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %62, label %60

60:                                               ; preds = %57
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 1
  store i8 %53, i8 addrspace(1)* %61, align 1, !tbaa !11
  br label %62

62:                                               ; preds = %60, %57
  %63 = and i32 %5, 4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %83, label %80

65:                                               ; preds = %47
  %66 = trunc i32 %7 to i8
  store i8 %66, i8 addrspace(1)* %42, align 1, !tbaa !11
  br label %67

67:                                               ; preds = %47, %65
  %68 = and i32 %5, 2
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %74, label %70

70:                                               ; preds = %67
  %71 = lshr i32 %7, 8
  %72 = trunc i32 %71 to i8
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 1
  store i8 %72, i8 addrspace(1)* %73, align 1, !tbaa !11
  br label %74

74:                                               ; preds = %70, %67
  %75 = and i32 %5, 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %83, label %77

77:                                               ; preds = %74
  %78 = lshr i32 %7, 16
  %79 = trunc i32 %78 to i8
  br label %80

80:                                               ; preds = %62, %77
  %81 = phi i8 [ %79, %77 ], [ %53, %62 ]
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 2
  store i8 %81, i8 addrspace(1)* %82, align 1, !tbaa !11
  br label %83

83:                                               ; preds = %80, %74, %62, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!9, !9, i64 0}
