; ModuleID = '../data/hip_kernels/3194/0/main.cu'
source_filename = "../data/hip_kernels/3194/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@gray_value = protected addrspace(4) externally_initialized global [3 x float] [float 0x3FD3333340000000, float 0x3FE28F5C20000000, float 0x3FBC28F5C0000000], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([3 x float] addrspace(4)* @gray_value to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9cuda_grayPhiiS_i(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = sdiv i32 %1, 3
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = add i32 %15, %6
  %17 = mul i32 %15, 3
  %18 = add i32 %17, %1
  %19 = icmp ult i32 %17, %2
  %20 = icmp slt i32 %16, %4
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %48

22:                                               ; preds = %5
  %23 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @gray_value, i64 0, i64 0), align 4, !tbaa !7
  %24 = sext i32 %18 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %24
  %26 = load i8, i8 addrspace(1)* %25, align 1, !tbaa !11, !amdgpu.noclobber !5
  %27 = uitofp i8 %26 to float
  %28 = fmul contract float %23, %27
  %29 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @gray_value, i64 0, i64 1), align 4, !tbaa !7
  %30 = add nsw i32 %18, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !11, !amdgpu.noclobber !5
  %34 = uitofp i8 %33 to float
  %35 = fmul contract float %29, %34
  %36 = fadd contract float %28, %35
  %37 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @gray_value, i64 0, i64 2), align 4, !tbaa !7
  %38 = add nsw i32 %18, 2
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !11, !amdgpu.noclobber !5
  %42 = uitofp i8 %41 to float
  %43 = fmul contract float %37, %42
  %44 = fadd contract float %36, %43
  %45 = fptoui float %44 to i8
  %46 = sext i32 %16 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %46
  store i8 %45, i8 addrspace(1)* %47, align 1, !tbaa !11
  br label %48

48:                                               ; preds = %5, %22
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
