; ModuleID = '../data/hip_kernels/3039/4/main.cu'
source_filename = "../data/hip_kernels/3039/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9grayscalePhS_iii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %3
  %24 = icmp slt i32 %22, %2
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %71

26:                                               ; preds = %5
  %27 = mul nsw i32 %14, %2
  %28 = add nsw i32 %27, %22
  %29 = mul nsw i32 %28, %4
  %30 = add nsw i32 %29, 2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !7, !amdgpu.noclobber !5
  %34 = uitofp i8 %33 to float
  %35 = add nsw i32 %29, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = uitofp i8 %38 to float
  %40 = sext i32 %29 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = uitofp i8 %42 to float
  %44 = fmul contract float %34, 0x3FD926E980000000
  %45 = fmul contract float %39, 0x3FE89BA5E0000000
  %46 = fadd contract float %44, %45
  %47 = fmul contract float %43, 0x3FC83126E0000000
  %48 = fadd contract float %46, %47
  %49 = fcmp contract oge float %48, 2.550000e+02
  %50 = select contract i1 %49, float 2.550000e+02, float %48
  %51 = fptoui float %50 to i8
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %31
  store i8 %51, i8 addrspace(1)* %52, align 1, !tbaa !7
  %53 = fmul contract float %34, 0x3FD6560420000000
  %54 = fmul contract float %39, 0x3FE5F3B640000000
  %55 = fadd contract float %53, %54
  %56 = fmul contract float %43, 0x3FC5810620000000
  %57 = fadd contract float %55, %56
  %58 = fcmp contract oge float %57, 2.550000e+02
  %59 = select contract i1 %58, float 2.550000e+02, float %57
  %60 = fptoui float %59 to i8
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %36
  store i8 %60, i8 addrspace(1)* %61, align 1, !tbaa !7
  %62 = fmul contract float %34, 0x3FD16872C0000000
  %63 = fmul contract float %39, 0x3FE1168720000000
  %64 = fadd contract float %62, %63
  %65 = fmul contract float %43, 0x3FC0C49BA0000000
  %66 = fadd contract float %64, %65
  %67 = fcmp contract oge float %66, 2.550000e+02
  %68 = select contract i1 %67, float 2.550000e+02, float %66
  %69 = fptoui float %68 to i8
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %40
  store i8 %69, i8 addrspace(1)* %70, align 1, !tbaa !7
  br label %71

71:                                               ; preds = %26, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
