; ModuleID = '../data/hip_kernels/12009/6/main.cu'
source_filename = "../data/hip_kernels/12009/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL23sieveOfEratosthenesCUDAPcm = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL23sieveOfEratosthenesCUDAPcm(i8 addrspace(1)* nocapture %0, i64 %1) local_unnamed_addr #0 comdat {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = icmp eq i32 %3, 0
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %6 = icmp eq i32 %5, 0
  %7 = select i1 %4, i1 %6, i1 false
  br i1 %7, label %8, label %17

8:                                                ; preds = %2
  store i8 1, i8 addrspace(1)* %0, align 1, !tbaa !5
  %9 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 1
  store i8 1, i8 addrspace(1)* %9, align 1, !tbaa !5
  %10 = icmp ugt i64 %1, 4
  br i1 %10, label %11, label %69

11:                                               ; preds = %8, %11
  %12 = phi i64 [ %15, %11 ], [ 4, %8 ]
  %13 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %12
  store i8 1, i8 addrspace(1)* %13, align 1, !tbaa !5
  %14 = add nuw nsw i64 %12, 2
  %15 = and i64 %14, 4294967295
  %16 = icmp ult i64 %15, %1
  br i1 %16, label %11, label %69, !llvm.loop !8

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !10, !invariant.load !11
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = add i32 %24, %3
  %26 = uitofp i64 %1 to double
  %27 = icmp eq i64 %1, 0
  %28 = select i1 %27, double 0x4FF0000000000000, double 1.000000e+00
  %29 = fmul double %28, %26
  %30 = tail call double @llvm.amdgcn.rsq.f64(double %29)
  %31 = fmul double %29, %30
  %32 = fmul double %30, 5.000000e-01
  %33 = fneg double %32
  %34 = tail call double @llvm.fma.f64(double %33, double %31, double 5.000000e-01)
  %35 = tail call double @llvm.fma.f64(double %32, double %34, double %32)
  %36 = tail call double @llvm.fma.f64(double %31, double %34, double %31)
  %37 = fneg double %36
  %38 = tail call double @llvm.fma.f64(double %37, double %36, double %29)
  %39 = tail call double @llvm.fma.f64(double %38, double %35, double %36)
  %40 = fneg double %39
  %41 = tail call double @llvm.fma.f64(double %40, double %39, double %29)
  %42 = tail call double @llvm.fma.f64(double %41, double %35, double %39)
  %43 = select i1 %27, double 0x37F0000000000000, double 1.000000e+00
  %44 = fmul double %43, %42
  %45 = fcmp oeq double %29, 0.000000e+00
  %46 = fcmp oeq double %29, 0x7FF0000000000000
  %47 = or i1 %45, %46
  %48 = select i1 %47, double %29, double %44
  %49 = fptoui double %48 to i64
  %50 = sext i32 %25 to i64
  %51 = icmp ult i64 %50, %49
  br i1 %51, label %52, label %69

52:                                               ; preds = %17
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !5, !amdgpu.noclobber !11
  %55 = icmp eq i8 %54, 0
  %56 = icmp sgt i32 %25, 1
  %57 = select i1 %55, i1 %56, i1 false
  %58 = mul nsw i32 %25, %25
  %59 = zext i32 %58 to i64
  %60 = icmp ult i64 %59, %1
  %61 = select i1 %57, i1 %60, i1 false
  br i1 %61, label %62, label %69

62:                                               ; preds = %52, %62
  %63 = phi i64 [ %67, %62 ], [ %59, %52 ]
  %64 = phi i32 [ %66, %62 ], [ %58, %52 ]
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  store i8 1, i8 addrspace(1)* %65, align 1, !tbaa !5
  %66 = add nsw i32 %64, %25
  %67 = sext i32 %66 to i64
  %68 = icmp ult i64 %67, %1
  br i1 %68, label %62, label %69, !llvm.loop !12

69:                                               ; preds = %62, %11, %8, %17, %52
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{i16 1, i16 1025}
!11 = !{}
!12 = distinct !{!12, !9}
