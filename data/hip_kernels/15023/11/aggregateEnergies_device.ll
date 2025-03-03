; ModuleID = '../data/hip_kernels/15023/11/main.cu'
source_filename = "../data/hip_kernels/15023/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17aggregateEnergiesPdiii(double addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = mul nsw i32 %3, %2
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul i32 %5, %14
  %16 = icmp sgt i32 %3, 1
  br i1 %16, label %17, label %94

17:                                               ; preds = %4
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 %18
  %20 = add i32 %3, -1
  %21 = add i32 %3, -2
  %22 = and i32 %20, 3
  %23 = icmp ult i32 %21, 3
  br i1 %23, label %75, label %24

24:                                               ; preds = %17
  %25 = and i32 %20, -4
  br label %26

26:                                               ; preds = %71, %24
  %27 = phi i32 [ 1, %24 ], [ %72, %71 ]
  %28 = phi i32 [ 0, %24 ], [ %73, %71 ]
  %29 = mul nsw i32 %27, %2
  %30 = add nsw i32 %29, %15
  %31 = icmp slt i32 %30, %1
  br i1 %31, label %32, label %38

32:                                               ; preds = %26
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %36 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %37 = fadd contract double %35, %36
  store double %37, double addrspace(1)* %19, align 8, !tbaa !7
  store double 0.000000e+00, double addrspace(1)* %34, align 8, !tbaa !7
  br label %38

38:                                               ; preds = %26, %32
  %39 = add nuw nsw i32 %27, 1
  %40 = mul nsw i32 %39, %2
  %41 = add nsw i32 %40, %15
  %42 = icmp slt i32 %41, %1
  br i1 %42, label %43, label %49

43:                                               ; preds = %38
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7
  %47 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %48 = fadd contract double %46, %47
  store double %48, double addrspace(1)* %19, align 8, !tbaa !7
  store double 0.000000e+00, double addrspace(1)* %45, align 8, !tbaa !7
  br label %49

49:                                               ; preds = %43, %38
  %50 = add nuw nsw i32 %27, 2
  %51 = mul nsw i32 %50, %2
  %52 = add nsw i32 %51, %15
  %53 = icmp slt i32 %52, %1
  br i1 %53, label %54, label %60

54:                                               ; preds = %49
  %55 = sext i32 %52 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7
  %58 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %59 = fadd contract double %57, %58
  store double %59, double addrspace(1)* %19, align 8, !tbaa !7
  store double 0.000000e+00, double addrspace(1)* %56, align 8, !tbaa !7
  br label %60

60:                                               ; preds = %54, %49
  %61 = add nuw nsw i32 %27, 3
  %62 = mul nsw i32 %61, %2
  %63 = add nsw i32 %62, %15
  %64 = icmp slt i32 %63, %1
  br i1 %64, label %65, label %71

65:                                               ; preds = %60
  %66 = sext i32 %63 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %0, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %70 = fadd contract double %68, %69
  store double %70, double addrspace(1)* %19, align 8, !tbaa !7
  store double 0.000000e+00, double addrspace(1)* %67, align 8, !tbaa !7
  br label %71

71:                                               ; preds = %65, %60
  %72 = add nuw nsw i32 %27, 4
  %73 = add i32 %28, 4
  %74 = icmp eq i32 %73, %25
  br i1 %74, label %75, label %26, !llvm.loop !11

75:                                               ; preds = %71, %17
  %76 = phi i32 [ 1, %17 ], [ %72, %71 ]
  %77 = icmp eq i32 %22, 0
  br i1 %77, label %94, label %78

78:                                               ; preds = %75, %90
  %79 = phi i32 [ %91, %90 ], [ %76, %75 ]
  %80 = phi i32 [ %92, %90 ], [ 0, %75 ]
  %81 = mul nsw i32 %79, %2
  %82 = add nsw i32 %81, %15
  %83 = icmp slt i32 %82, %1
  br i1 %83, label %84, label %90

84:                                               ; preds = %78
  %85 = sext i32 %82 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %0, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7
  %88 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %89 = fadd contract double %87, %88
  store double %89, double addrspace(1)* %19, align 8, !tbaa !7
  store double 0.000000e+00, double addrspace(1)* %86, align 8, !tbaa !7
  br label %90

90:                                               ; preds = %84, %78
  %91 = add nuw nsw i32 %79, 1
  %92 = add i32 %80, 1
  %93 = icmp eq i32 %92, %22
  br i1 %93, label %94, label %78, !llvm.loop !13

94:                                               ; preds = %75, %90, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
