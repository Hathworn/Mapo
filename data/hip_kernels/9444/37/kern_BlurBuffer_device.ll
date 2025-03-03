; ModuleID = '../data/hip_kernels/9444/37/main.cu'
source_filename = "../data/hip_kernels/9444/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15kern_BlurBufferPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = udiv i32 %14, %11
  %17 = mul i32 %16, %11
  %18 = icmp ugt i32 %14, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 8, !tbaa !16
  %25 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %24, %28
  %30 = mul i32 %29, %28
  %31 = icmp ugt i32 %24, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %35 = mul i32 %33, %34
  %36 = add i32 %35, %21
  %37 = mul i32 %36, %20
  %38 = add i32 %37, %15
  %39 = mul i32 %38, %11
  %40 = add i32 %39, %6
  %41 = sdiv i32 %40, %3
  %42 = srem i32 %41, %4
  %43 = sext i32 %40 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !17, !amdgpu.noclobber !6
  %46 = sub nsw i32 %40, %3
  %47 = icmp sgt i32 %46, -1
  br i1 %47, label %48, label %52

48:                                               ; preds = %5
  %49 = zext i32 %46 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %52

52:                                               ; preds = %5, %48
  %53 = phi contract float [ %51, %48 ], [ 0.000000e+00, %5 ]
  %54 = add nsw i32 %40, %3
  %55 = icmp slt i32 %54, %2
  br i1 %55, label %56, label %60

56:                                               ; preds = %52
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %60

60:                                               ; preds = %52, %56
  %61 = phi contract float [ %59, %56 ], [ 0.000000e+00, %52 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp slt i32 %40, %2
  br i1 %62, label %63, label %74

63:                                               ; preds = %60
  %64 = fmul contract float %45, 0x3FE92B9660000000
  %65 = icmp sgt i32 %42, 0
  %66 = select contract i1 %65, float %53, float %45
  %67 = add nsw i32 %4, -1
  %68 = icmp slt i32 %42, %67
  %69 = select contract i1 %68, float %61, float %45
  %70 = fadd contract float %66, %69
  %71 = fmul contract float %70, 0x3FBB405C20000000
  %72 = fadd contract float %64, %71
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %72, float addrspace(1)* %73, align 4, !tbaa !17
  br label %74

74:                                               ; preds = %63, %60
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
