; ModuleID = '../data/hip_kernels/17687/14/main.cu'
source_filename = "../data/hip_kernels/17687/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17kernelCulcRhoRealiPdS_S_dd(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double %4, double %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %43

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %2, i64 %18
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !5
  %21 = getelementptr inbounds double, double addrspace(1)* %3, i64 %18
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !5
  %23 = fmul contract double %20, 5.000000e-01
  %24 = fmul contract double %20, %23
  %25 = getelementptr inbounds double, double addrspace(1)* %1, i64 %18
  %26 = fmul contract double %22, 5.000000e-01
  %27 = fmul contract double %22, %26
  %28 = fadd contract double %24, %27
  %29 = fmul contract double %4, 2.500000e-01
  %30 = fmul contract double %29, %20
  %31 = fmul contract double %20, %30
  %32 = fmul contract double %20, %31
  %33 = fmul contract double %20, %32
  %34 = fadd contract double %28, %33
  %35 = fdiv contract double %5, 6.000000e+00
  %36 = fmul contract double %35, %20
  %37 = fmul contract double %20, %36
  %38 = fmul contract double %20, %37
  %39 = fmul contract double %20, %38
  %40 = fmul contract double %20, %39
  %41 = fmul contract double %20, %40
  %42 = fadd contract double %34, %41
  store double %42, double addrspace(1)* %25, align 8, !tbaa !7
  br label %43

43:                                               ; preds = %17, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
