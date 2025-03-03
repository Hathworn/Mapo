; ModuleID = '../data/hip_kernels/8742/2/main.cu'
source_filename = "../data/hip_kernels/8742/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z30kernel_compute_gen_multiblocksPhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = add i32 %3, -1
  %15 = and i32 %13, %14
  %16 = add i32 %15, -1
  %17 = and i32 %16, %14
  %18 = add i32 %15, 1
  %19 = and i32 %18, %14
  %20 = sub i32 %13, %15
  %21 = sub i32 %20, %3
  %22 = and i32 %21, %2
  %23 = add i32 %20, %3
  %24 = and i32 %23, %2
  %25 = add i32 %22, %17
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !5
  %29 = add i32 %22, %15
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !7, !amdgpu.noclobber !5
  %33 = add i8 %32, %28
  %34 = add i32 %22, %19
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !7, !amdgpu.noclobber !5
  %38 = add i8 %33, %37
  %39 = add i32 %17, %20
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = add i8 %38, %42
  %44 = add i32 %19, %20
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %45
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7, !amdgpu.noclobber !5
  %48 = add i8 %43, %47
  %49 = add i32 %24, %17
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = add i8 %48, %52
  %54 = add i32 %24, %15
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7, !amdgpu.noclobber !5
  %58 = add i8 %53, %57
  %59 = add i32 %24, %19
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !7, !amdgpu.noclobber !5
  %63 = add i8 %58, %62
  switch i8 %63, label %69 [
    i8 3, label %70
    i8 2, label %64
  ]

64:                                               ; preds = %4
  %65 = zext i32 %13 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7, !amdgpu.noclobber !5
  %68 = icmp ne i8 %67, 0
  br label %70

69:                                               ; preds = %4
  br label %70

70:                                               ; preds = %4, %69, %64
  %71 = phi i1 [ true, %4 ], [ %68, %64 ], [ false, %69 ]
  %72 = zext i1 %71 to i8
  %73 = zext i32 %13 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %73
  store i8 %72, i8 addrspace(1)* %74, align 1, !tbaa !7
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
