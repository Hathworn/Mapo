; ModuleID = '../data/hip_kernels/15587/4/main.cu'
source_filename = "../data/hip_kernels/15587/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9initArrayPjPdS_i(i32 addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %69

15:                                               ; preds = %4
  %16 = load double, double addrspace(1)* %1, align 8, !tbaa !7
  %17 = fadd contract double %16, 1.000000e+00
  store double %17, double addrspace(1)* %1, align 8, !tbaa !7
  %18 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !11
  %19 = add i32 %18, 1
  store i32 %19, i32 addrspace(1)* %0, align 4, !tbaa !11
  store i32 %18, i32 addrspace(1)* %2, align 4, !tbaa !11
  %20 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7
  %22 = fadd contract double %21, 1.000000e+00
  store double %22, double addrspace(1)* %20, align 8, !tbaa !7
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !11
  %25 = add i32 %24, 1
  store i32 %25, i32 addrspace(1)* %23, align 4, !tbaa !11
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  store i32 %24, i32 addrspace(1)* %26, align 4, !tbaa !11
  %27 = getelementptr inbounds double, double addrspace(1)* %1, i64 2
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !7
  %29 = fadd contract double %28, 1.000000e+00
  store double %29, double addrspace(1)* %27, align 8, !tbaa !7
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 2
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !11
  %32 = add i32 %31, 1
  store i32 %32, i32 addrspace(1)* %30, align 4, !tbaa !11
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 2
  store i32 %31, i32 addrspace(1)* %33, align 4, !tbaa !11
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 3
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %36 = fadd contract double %35, 1.000000e+00
  store double %36, double addrspace(1)* %34, align 8, !tbaa !7
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 3
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !11
  %39 = add i32 %38, 1
  store i32 %39, i32 addrspace(1)* %37, align 4, !tbaa !11
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 3
  store i32 %38, i32 addrspace(1)* %40, align 4, !tbaa !11
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 4
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7
  %43 = fadd contract double %42, 1.000000e+00
  store double %43, double addrspace(1)* %41, align 8, !tbaa !7
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 4
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !11
  %46 = add i32 %45, 1
  store i32 %46, i32 addrspace(1)* %44, align 4, !tbaa !11
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 4
  store i32 %45, i32 addrspace(1)* %47, align 4, !tbaa !11
  %48 = getelementptr inbounds double, double addrspace(1)* %1, i64 5
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = fadd contract double %49, 1.000000e+00
  store double %50, double addrspace(1)* %48, align 8, !tbaa !7
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 5
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !11
  %53 = add i32 %52, 1
  store i32 %53, i32 addrspace(1)* %51, align 4, !tbaa !11
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 5
  store i32 %52, i32 addrspace(1)* %54, align 4, !tbaa !11
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 6
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7
  %57 = fadd contract double %56, 1.000000e+00
  store double %57, double addrspace(1)* %55, align 8, !tbaa !7
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 6
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !11
  %60 = add i32 %59, 1
  store i32 %60, i32 addrspace(1)* %58, align 4, !tbaa !11
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 6
  store i32 %59, i32 addrspace(1)* %61, align 4, !tbaa !11
  %62 = getelementptr inbounds double, double addrspace(1)* %1, i64 7
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = fadd contract double %63, 1.000000e+00
  store double %64, double addrspace(1)* %62, align 8, !tbaa !7
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 7
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !11
  %67 = add i32 %66, 1
  store i32 %67, i32 addrspace(1)* %65, align 4, !tbaa !11
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 7
  store i32 %66, i32 addrspace(1)* %68, align 4, !tbaa !11
  br label %69

69:                                               ; preds = %15, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
