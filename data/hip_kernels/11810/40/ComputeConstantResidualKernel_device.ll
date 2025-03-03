; ModuleID = '../data/hip_kernels/11810/40/main.cu'
source_filename = "../data/hip_kernels/11810/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z29ComputeConstantResidualKernelPdS_PiS0_iidS_S_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, double %6, double addrspace(1)* nocapture %7, double addrspace(1)* nocapture %8, double addrspace(1)* nocapture readonly %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = icmp slt i32 %28, %5
  %30 = icmp slt i32 %20, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %68

32:                                               ; preds = %11
  %33 = icmp eq i32 %10, 0
  %34 = fdiv contract double 1.000000e+00, %6
  %35 = sitofp i32 %4 to double
  %36 = fdiv contract double 0x401921FB54442D18, %35
  %37 = sext i32 %28 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !6
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !6
  %42 = fmul contract double %39, %41
  %43 = fmul contract double %42, %6
  %44 = fmul contract double %43, %35
  %45 = fmul contract double %44, 5.000000e-01
  %46 = fdiv contract double %45, 0x400921FB54442D18
  %47 = fadd contract double %46, 5.000000e-01
  %48 = tail call double @llvm.floor.f64(double %47)
  %49 = fptosi double %48 to i64
  %50 = trunc i64 %49 to i32
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  store i32 %50, i32 addrspace(1)* %51, align 4, !tbaa !11
  %52 = fsub contract double %46, %48
  %53 = getelementptr inbounds double, double addrspace(1)* %9, i64 %37
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !6
  %55 = fmul contract double %54, %52
  %56 = fmul contract double %34, %55
  %57 = fmul contract double %36, %56
  %58 = mul nsw i32 %28, %4
  %59 = add nsw i32 %58, %20
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %7, i64 %60
  store double %57, double addrspace(1)* %61, align 8, !tbaa !7
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %37
  br i1 %33, label %63, label %67

63:                                               ; preds = %32
  store i32 1, i32 addrspace(1)* %62, align 4, !tbaa !11
  %64 = getelementptr inbounds double, double addrspace(1)* %8, i64 %60
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = fadd contract double %57, %65
  store double %66, double addrspace(1)* %64, align 8, !tbaa !7
  store double 0.000000e+00, double addrspace(1)* %61, align 8, !tbaa !7
  br label %68

67:                                               ; preds = %32
  store i32 0, i32 addrspace(1)* %62, align 4, !tbaa !11
  br label %68

68:                                               ; preds = %63, %67, %11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
