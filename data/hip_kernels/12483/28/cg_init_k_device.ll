; ModuleID = '../data/hip_kernels/12483/28/main.cu'
source_filename = "../data/hip_kernels/12483/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9cg_init_kiiiPKdPdS1_dd(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture writeonly %5, double %6, double %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = mul nsw i32 %1, %0
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %57

20:                                               ; preds = %8
  %21 = shl nsw i32 %2, 1
  %22 = add nsw i32 %21, %0
  %23 = add nsw i32 %22, -1
  %24 = freeze i32 %17
  %25 = freeze i32 %0
  %26 = sdiv i32 %24, %25
  %27 = mul i32 %26, %25
  %28 = sub i32 %24, %27
  %29 = mul nsw i32 %22, %2
  %30 = add nsw i32 %28, %29
  %31 = mul nsw i32 %26, %23
  %32 = add nsw i32 %30, %31
  %33 = add nsw i32 %32, -1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !6
  %37 = sext i32 %32 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %3, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !6
  %40 = fadd contract double %36, %39
  %41 = fmul contract double %40, %6
  %42 = fmul contract double %36, 2.000000e+00
  %43 = fmul contract double %42, %39
  %44 = fdiv contract double %41, %43
  %45 = getelementptr inbounds double, double addrspace(1)* %4, i64 %37
  store double %44, double addrspace(1)* %45, align 8, !tbaa !7
  %46 = sub nsw i32 %32, %23
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %3, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = load double, double addrspace(1)* %38, align 8, !tbaa !7
  %51 = fadd contract double %49, %50
  %52 = fmul contract double %51, %7
  %53 = fmul contract double %49, 2.000000e+00
  %54 = fmul contract double %53, %50
  %55 = fdiv contract double %52, %54
  %56 = getelementptr inbounds double, double addrspace(1)* %5, i64 %37
  store double %55, double addrspace(1)* %56, align 8, !tbaa !7
  br label %57

57:                                               ; preds = %8, %20
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
