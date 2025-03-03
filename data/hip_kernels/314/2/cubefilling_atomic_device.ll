; ModuleID = '../data/hip_kernels/314/2/main.cu'
source_filename = "../data/hip_kernels/314/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.dim3 = type { i32, i32, i32 }

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z18cubefilling_atomicPKfPfS1_4dim3iiS2_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, %struct.dim3 addrspace(4)* nocapture readonly byref(%struct.dim3) align 4 %3, i32 %4, i32 %5, %struct.dim3 addrspace(4)* nocapture readonly byref(%struct.dim3) align 4 %6) local_unnamed_addr #0 {
  %8 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %3, i64 0, i32 0
  %9 = load i32, i32 addrspace(4)* %8, align 4, !amdgpu.noclobber !4
  %10 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %3, i64 0, i32 1
  %11 = load i32, i32 addrspace(4)* %10, align 4, !amdgpu.noclobber !4
  %12 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %6, i64 0, i32 0
  %13 = load i32, i32 addrspace(4)* %12, align 4, !amdgpu.noclobber !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !4
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = zext i32 %22 to i64
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !4
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = add i32 %29, %30
  %32 = zext i32 %31 to i64
  %33 = icmp ult i32 %22, %9
  %34 = icmp ult i32 %31, %11
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %60

36:                                               ; preds = %7
  %37 = zext i32 %9 to i64
  %38 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %6, i64 0, i32 1
  %39 = load i32, i32 addrspace(4)* %38, align 4, !amdgpu.noclobber !4
  %40 = mul nuw i64 %32, %37
  %41 = add nuw i64 %40, %23
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !4
  %44 = sext i32 %4 to i64
  %45 = udiv i64 %23, %44
  %46 = zext i32 %13 to i64
  %47 = udiv i64 %32, %44
  %48 = mul nuw i64 %47, %46
  %49 = add nuw i64 %48, %45
  %50 = mul i32 %39, %13
  %51 = fptosi float %43 to i32
  %52 = sdiv i32 %51, %5
  %53 = mul i32 %50, %52
  %54 = zext i32 %53 to i64
  %55 = add nuw i64 %49, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = atomicrmw fadd float addrspace(1)* %56, float %43 syncscope("agent-one-as") monotonic, align 4
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  %59 = atomicrmw fadd float addrspace(1)* %58, float 1.000000e+00 syncscope("agent-one-as") monotonic, align 4
  br label %60

60:                                               ; preds = %36, %7
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

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{}
!5 = !{i16 1, i16 1025}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
