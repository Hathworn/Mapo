; ModuleID = '../data/hip_kernels/10393/8/main.cu'
source_filename = "../data/hip_kernels/10393/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @daxpy_matrix_vector(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double %2, double addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = freeze i32 %17
  %19 = freeze i32 %5
  %20 = sdiv i32 %18, %19
  %21 = mul i32 %20, %19
  %22 = sub i32 %18, %21
  %23 = icmp slt i32 %20, %4
  %24 = icmp sgt i32 %5, -1
  %25 = and i1 %24, %23
  br i1 %25, label %26, label %40

26:                                               ; preds = %8
  %27 = mul nsw i32 %20, %5
  %28 = add nsw i32 %27, %22
  %29 = icmp eq i32 %6, 1
  %30 = sext i32 %28 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7
  %33 = getelementptr inbounds double, double addrspace(1)* %3, i64 %30
  %34 = select i1 %29, i32 %22, i32 %20
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %38 = fmul contract double %37, %2
  %39 = fadd contract double %32, %38
  store double %39, double addrspace(1)* %33, align 8, !tbaa !7
  br label %40

40:                                               ; preds = %26, %8
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
