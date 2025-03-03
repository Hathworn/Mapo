; ModuleID = '../data/hip_kernels/8839/1/main.cu'
source_filename = "../data/hip_kernels/8839/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15sqr_norm_kerneliPfS_ff(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !13
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !13
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = bitcast i8 addrspace(4)* %8 to <2 x i16> addrspace(4)*
  %16 = load <2 x i16>, <2 x i16> addrspace(4)* %15, align 4, !invariant.load !14
  %17 = zext <2 x i16> %16 to <2 x i32>
  %18 = extractelement <2 x i32> %17, i64 0
  %19 = mul nuw nsw i32 %12, %18
  %20 = add nuw nsw i32 %19, %13
  %21 = udiv i32 %11, %18
  %22 = mul i32 %21, %18
  %23 = icmp ugt i32 %11, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %14
  %27 = add i32 %26, %7
  %28 = extractelement <2 x i32> %17, i64 1
  %29 = mul nuw nsw i32 %28, %18
  %30 = mul i32 %27, %29
  %31 = add i32 %20, %30
  %32 = shl i32 %31, 1
  %33 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %20
  %34 = sext i32 %32 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !15, !amdgpu.noclobber !14
  %37 = fmul contract float %36, %36
  %38 = add nuw nsw i32 %32, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !15, !amdgpu.noclobber !14
  %42 = fmul contract float %41, %41
  %43 = fadd contract float %37, %42
  store float %43, float addrspace(3)* %33, align 4, !tbaa !15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add nuw nsw i32 %29, 1
  br label %47

45:                                               ; preds = %62
  %46 = icmp eq i32 %20, 0
  br i1 %46, label %64, label %72

47:                                               ; preds = %5, %62
  %48 = phi i32 [ %52, %62 ], [ %29, %5 ]
  %49 = phi i32 [ %52, %62 ], [ %44, %5 ]
  %50 = lshr i32 %49, 1
  %51 = and i32 %48, 1
  %52 = add nuw i32 %51, %50
  %53 = icmp ult i32 %20, %52
  br i1 %53, label %54, label %62

54:                                               ; preds = %47
  %55 = add i32 %52, %20
  %56 = icmp ult i32 %55, %48
  br i1 %56, label %57, label %62

57:                                               ; preds = %54
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %55
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !15
  %60 = load float, float addrspace(3)* %33, align 4, !tbaa !15
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(3)* %33, align 4, !tbaa !15
  br label %62

62:                                               ; preds = %57, %54, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %52, 2
  br i1 %63, label %45, label %47, !llvm.loop !19

64:                                               ; preds = %45
  %65 = sdiv i32 %27, %0
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !15
  %69 = fmul contract float %3, %4
  %70 = fdiv contract float %68, %69
  %71 = atomicrmw fadd float addrspace(1)* %67, float %70 syncscope("agent-one-as") monotonic, align 4
  br label %72

72:                                               ; preds = %64, %45
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i32 0, i32 1024}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
