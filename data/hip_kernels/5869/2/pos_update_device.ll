; ModuleID = '../data/hip_kernels/5869/2/main.cu'
source_filename = "../data/hip_kernels/5869/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10pos_updateiidPdS_S_(i32 %0, i32 %1, double %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture %4, double addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = freeze i32 %15
  %17 = freeze i32 %0
  %18 = sdiv i32 %16, %17
  %19 = mul i32 %18, %17
  %20 = sub i32 %16, %19
  %21 = add nsw i32 %1, -1
  %22 = icmp slt i32 %18, %21
  %23 = icmp sgt i32 %18, 0
  %24 = and i1 %22, %23
  br i1 %24, label %25, label %42

25:                                               ; preds = %6
  %26 = add nsw i32 %0, -1
  %27 = icmp slt i32 %20, %26
  %28 = icmp sgt i32 %20, 0
  %29 = and i1 %27, %28
  br i1 %29, label %30, label %42

30:                                               ; preds = %25
  %31 = sext i32 %15 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %4, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !7, !amdgpu.noclobber !5
  %34 = getelementptr inbounds double, double addrspace(1)* %5, i64 %31
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = fmul contract double %35, %2
  %37 = fadd contract double %33, %36
  store double %37, double addrspace(1)* %32, align 8, !tbaa !7
  %38 = getelementptr inbounds double, double addrspace(1)* %3, i64 %31
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7
  %40 = fmul contract double %37, %2
  %41 = fadd contract double %39, %40
  store double %41, double addrspace(1)* %38, align 8, !tbaa !7
  br label %42

42:                                               ; preds = %30, %25, %6
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
