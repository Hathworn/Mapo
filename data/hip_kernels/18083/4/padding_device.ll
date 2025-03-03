; ModuleID = '../data/hip_kernels/18083/4/main.cu'
source_filename = "../data/hip_kernels/18083/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7paddingPiS_iiiiii(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 16
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 8, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !15
  %28 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !13, !invariant.load !14
  %31 = zext i16 %30 to i32
  %32 = udiv i32 %27, %31
  %33 = mul i32 %32, %31
  %34 = icmp ugt i32 %27, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %24
  %38 = add i32 %37, %9
  %39 = mul i32 %38, %22
  %40 = add i32 %39, %23
  %41 = mul i32 %40, %31
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %43 = add i32 %41, %42
  %44 = mul i32 %5, %4
  %45 = mul i32 %44, %3
  %46 = freeze i32 %43
  %47 = freeze i32 %45
  %48 = udiv i32 %46, %47
  %49 = mul i32 %48, %47
  %50 = sub i32 %46, %49
  %51 = freeze i32 %44
  %52 = udiv i32 %50, %51
  %53 = mul i32 %52, %51
  %54 = sub i32 %50, %53
  %55 = freeze i32 %54
  %56 = freeze i32 %5
  %57 = udiv i32 %55, %56
  %58 = mul i32 %57, %56
  %59 = sub i32 %55, %58
  %60 = mul nsw i32 %48, %3
  %61 = mul i32 %44, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %62
  %64 = mul i32 %44, %52
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %63, i64 %65
  %67 = mul nsw i32 %57, %5
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %66, i64 %68
  %70 = sext i32 %59 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %69, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !17, !amdgpu.noclobber !14
  %73 = shl nsw i32 %6, 1
  %74 = add nsw i32 %73, %4
  %75 = shl nsw i32 %7, 1
  %76 = add nsw i32 %75, %5
  %77 = mul i32 %76, %74
  %78 = mul i32 %77, %60
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = mul i32 %77, %52
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %80, i64 %82
  %84 = add nsw i32 %57, %6
  %85 = mul nsw i32 %84, %76
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %83, i64 %86
  %88 = add nsw i32 %59, %7
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %87, i64 %89
  store i32 %72, i32 addrspace(1)* %90, align 4, !tbaa !17
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 16}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 12}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
