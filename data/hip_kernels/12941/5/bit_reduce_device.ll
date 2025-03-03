; ModuleID = '../data/hip_kernels/12941/5/main.cu'
source_filename = "../data/hip_kernels/12941/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10bit_reducePKjPj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = add i32 %10, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = lshr i32 %14, 8
  %16 = lshr i32 %14, 16
  %17 = lshr i32 %14, 24
  %18 = insertelement <4 x i32> poison, i32 %14, i64 0
  %19 = insertelement <4 x i32> %18, i32 %15, i64 1
  %20 = insertelement <4 x i32> %19, i32 %16, i64 2
  %21 = insertelement <4 x i32> %20, i32 %17, i64 3
  %22 = trunc <4 x i32> %21 to <4 x i8>
  %23 = icmp ult i32 %14, 256
  br i1 %23, label %24, label %29

24:                                               ; preds = %2
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  store i32 1, i32 addrspace(1)* %25, align 4, !tbaa !7
  %26 = bitcast i32 addrspace(1)* %25 to i8 addrspace(1)*
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %26, i64 1
  %28 = extractelement <4 x i8> %22, i64 0
  store i8 %28, i8 addrspace(1)* %27, align 1, !tbaa !11
  br label %40

29:                                               ; preds = %2
  %30 = icmp ult i32 %14, 65536
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  %32 = bitcast i32 addrspace(1)* %31 to i8 addrspace(1)*
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 1
  br i1 %30, label %34, label %38

34:                                               ; preds = %29
  store i32 2, i32 addrspace(1)* %31, align 4, !tbaa !7
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 2
  %36 = extractelement <4 x i8> %22, i64 1
  store i8 %36, i8 addrspace(1)* %35, align 1, !tbaa !11
  %37 = extractelement <4 x i8> %22, i64 0
  store i8 %37, i8 addrspace(1)* %33, align 1, !tbaa !11
  br label %40

38:                                               ; preds = %29
  store i32 4, i32 addrspace(1)* %31, align 4, !tbaa !7
  %39 = bitcast i8 addrspace(1)* %33 to <4 x i8> addrspace(1)*
  store <4 x i8> %22, <4 x i8> addrspace(1)* %39, align 1, !tbaa !11
  br label %40

40:                                               ; preds = %34, %38, %24
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
