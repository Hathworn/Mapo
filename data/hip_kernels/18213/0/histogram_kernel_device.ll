; ModuleID = '../data/hip_kernels/18213/0/main.cu'
source_filename = "../data/hip_kernels/18213/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z16histogram_kernelPfS_S_S_iiiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = mul nsw i32 %7, %6
  %20 = mul nsw i32 %19, %5
  %21 = icmp slt i32 %18, %20
  br i1 %21, label %22, label %66

22:                                               ; preds = %9
  %23 = freeze i32 %18
  %24 = freeze i32 %19
  %25 = sdiv i32 %23, %24
  %26 = mul i32 %25, %24
  %27 = sub i32 %23, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = fpext float %30 to double
  %32 = fcmp contract uge double %31, 1.000000e-01
  br i1 %32, label %33, label %66

33:                                               ; preds = %22
  %34 = sext i32 %18 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = sext i32 %25 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fcmp contract oeq float %39, %41
  %43 = fadd contract float %39, -1.000000e+00
  %44 = fadd contract float %41, 1.000000e+00
  %45 = select i1 %42, float %44, float %41
  %46 = select i1 %42, float %43, float %39
  %47 = fcmp contract ugt float %46, %36
  %48 = fcmp contract ugt float %36, %45
  %49 = select i1 %47, i1 true, i1 %48
  br i1 %49, label %66, label %50

50:                                               ; preds = %33
  %51 = fsub contract float %36, %46
  %52 = fsub contract float %45, %46
  %53 = fdiv contract float %51, %52
  %54 = sitofp i32 %4 to float
  %55 = fmul contract float %53, %54
  %56 = add nsw i32 %4, -1
  %57 = sitofp i32 %56 to float
  %58 = fcmp contract olt float %55, %57
  %59 = select contract i1 %58, float %55, float %57
  %60 = fptosi float %59 to i32
  %61 = mul nsw i32 %25, %4
  %62 = add nsw i32 %61, %60
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %8, i64 %63
  %65 = atomicrmw fadd float addrspace(1)* %64, float 1.000000e+00 syncscope("agent-one-as") monotonic, align 4
  br label %66

66:                                               ; preds = %50, %33, %22, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
