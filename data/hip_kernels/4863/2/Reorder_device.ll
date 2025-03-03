; ModuleID = '../data/hip_kernels/4863/2/main.cu'
source_filename = "../data/hip_kernels/4863/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7ReorderPxPiixS_(i64 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i64 %3, i64 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = sitofp i32 %2 to float
  %15 = tail call i1 @llvm.amdgcn.class.f32(float %14, i32 144)
  %16 = add nsw i32 %13, %6
  %17 = sext i32 %16 to i64
  %18 = icmp slt i64 %17, %3
  br i1 %18, label %19, label %37

19:                                               ; preds = %5
  %20 = select i1 %15, float 0x41F0000000000000, float 1.000000e+00
  %21 = fmul float %20, %14
  %22 = tail call float @llvm.log2.f32(float %21)
  %23 = select i1 %15, float 3.200000e+01, float 0.000000e+00
  %24 = fsub float %22, %23
  %25 = tail call float @llvm.ceil.f32(float %24)
  %26 = fptoui float %25 to i32
  %27 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %17
  %28 = load i64, i64 addrspace(1)* %27, align 8, !tbaa !7, !amdgpu.noclobber !6
  %29 = trunc i64 %28 to i32
  %30 = tail call i32 asm "bfe.u32 $0, $1, $2, $3;", "=r,r,r,r"(i32 %29, i32 0, i32 %26) #3, !srcloc !11
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %33 = atomicrmw add i32 addrspace(1)* %32, i32 1 syncscope("agent-one-as") monotonic, align 4
  %34 = load i64, i64 addrspace(1)* %27, align 8, !tbaa !7
  %35 = sext i32 %33 to i64
  %36 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %35
  store i64 %34, i64 addrspace(1)* %36, align 8, !tbaa !7
  br label %37

37:                                               ; preds = %19, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind readnone }

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
!8 = !{!"long long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i64 7745018}
