; ModuleID = '../data/hip_kernels/17576/6/main.cu'
source_filename = "../data/hip_kernels/17576/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19create_FF_full_FoXSPfS_fPiS_iiiiE5FF_pt = internal unnamed_addr addrspace(3) global [7 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19create_FF_full_FoXSPfS_fPiS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp slt i32 %10, %5
  br i1 %11, label %12, label %31

12:                                               ; preds = %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = icmp sgt i32 %13, %6
  %15 = add nsw i32 %6, 1
  %16 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ19create_FF_full_FoXSPfS_fPiS_iiiiE5FF_pt, i32 0, i32 %6
  %20 = icmp slt i32 %13, %7
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !5
  %24 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %23, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %23, %27
  %29 = zext i1 %28 to i32
  %30 = zext i16 %24 to i32
  br label %32

31:                                               ; preds = %51, %9
  ret void

32:                                               ; preds = %12, %51
  %33 = phi i32 [ %10, %12 ], [ %53, %51 ]
  br i1 %14, label %45, label %34

34:                                               ; preds = %32
  %35 = mul nsw i32 %33, %15
  br label %36

36:                                               ; preds = %34, %36
  %37 = phi i32 [ %13, %34 ], [ %43, %36 ]
  %38 = add nsw i32 %37, %35
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  %42 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ19create_FF_full_FoXSPfS_fPiS_iiiiE5FF_pt, i32 0, i32 %37
  store float %41, float addrspace(3)* %42, align 4, !tbaa !16
  %43 = add i32 %37, %30
  %44 = icmp sgt i32 %43, %6
  br i1 %44, label %45, label %36, !llvm.loop !20

45:                                               ; preds = %36, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = load float, float addrspace(3)* %19, align 4, !tbaa !16
  %47 = fmul contract float %46, %2
  br i1 %20, label %48, label %51

48:                                               ; preds = %45
  %49 = mul nsw i32 %33, %8
  %50 = load float, float addrspace(3)* getelementptr inbounds ([7 x float], [7 x float] addrspace(3)* @_ZZ19create_FF_full_FoXSPfS_fPiS_iiiiE5FF_pt, i32 0, i32 0), align 16
  br label %55

51:                                               ; preds = %71, %45
  %52 = add i32 %26, %33
  %53 = add i32 %52, %29
  %54 = icmp slt i32 %53, %5
  br i1 %54, label %32, label %31, !llvm.loop !22

55:                                               ; preds = %48, %71
  %56 = phi i32 [ %13, %48 ], [ %78, %71 ]
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !23
  %60 = icmp sgt i32 %59, 5
  br i1 %60, label %61, label %65

61:                                               ; preds = %55
  %62 = add nsw i32 %56, %49
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  store float %50, float addrspace(1)* %64, align 4, !tbaa !16
  br label %71

65:                                               ; preds = %55
  %66 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ19create_FF_full_FoXSPfS_fPiS_iiiiE5FF_pt, i32 0, i32 %59
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !16
  %68 = add nsw i32 %56, %49
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  store float %67, float addrspace(1)* %70, align 4, !tbaa !16
  br label %71

71:                                               ; preds = %65, %61
  %72 = phi float [ %67, %65 ], [ %50, %61 ]
  %73 = phi float addrspace(1)* [ %70, %65 ], [ %64, %61 ]
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = fmul contract float %47, %75
  %77 = fadd contract float %72, %76
  store float %77, float addrspace(1)* %73, align 4, !tbaa !16
  %78 = add i32 %56, %25
  %79 = icmp slt i32 %78, %7
  br i1 %79, label %55, label %51, !llvm.loop !25
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !18, i64 0}
!25 = distinct !{!25, !21}
