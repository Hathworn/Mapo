; ModuleID = '../data/hip_kernels/11105/11/main.cu'
source_filename = "../data/hip_kernels/11105/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@cache = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19find_maximum_kernelPfS_Pij(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %11
  %23 = mul i32 %16, 3
  %24 = add i32 %23, 2
  %25 = icmp ult i32 %24, %3
  br i1 %25, label %26, label %56

26:                                               ; preds = %4, %26
  %27 = phi i32 [ %54, %26 ], [ %24, %4 ]
  %28 = phi i32 [ %53, %26 ], [ %23, %4 ]
  %29 = phi i32 [ %51, %26 ], [ 0, %4 ]
  %30 = phi float [ %50, %26 ], [ -1.000000e+00, %4 ]
  %31 = zext i32 %28 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !6
  %34 = add i32 %28, 1
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !6
  %38 = zext i32 %27 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !6
  %41 = fpext float %33 to double
  %42 = fmul contract double %41, 7.220000e-02
  %43 = fpext float %37 to double
  %44 = fmul contract double %43, 7.152000e-01
  %45 = fadd contract double %42, %44
  %46 = fpext float %40 to double
  %47 = fmul contract double %46, 2.126000e-01
  %48 = fadd contract double %45, %47
  %49 = fptrunc double %48 to float
  %50 = tail call float @llvm.maxnum.f32(float %30, float %49)
  %51 = add i32 %29, %22
  %52 = add i32 %16, %51
  %53 = mul i32 %52, 3
  %54 = add i32 %53, 2
  %55 = icmp ult i32 %54, %3
  br i1 %55, label %26, label %56, !llvm.loop !20

56:                                               ; preds = %26, %4
  %57 = phi float [ -1.000000e+00, %4 ], [ %50, %26 ]
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %5
  store float %57, float addrspace(3)* %58, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ult i16 %10, 2
  br i1 %59, label %72, label %60

60:                                               ; preds = %56, %70
  %61 = phi i32 [ %62, %70 ], [ %11, %56 ]
  %62 = lshr i32 %61, 1
  %63 = icmp ult i32 %5, %62
  br i1 %63, label %64, label %70

64:                                               ; preds = %60
  %65 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %66 = add nuw nsw i32 %62, %5
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %66
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !16
  %69 = tail call float @llvm.maxnum.f32(float %65, float %68)
  store float %69, float addrspace(3)* %58, align 4, !tbaa !16
  br label %70

70:                                               ; preds = %64, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp ult i32 %61, 4
  br i1 %71, label %72, label %60, !llvm.loop !22

72:                                               ; preds = %70, %56
  %73 = icmp eq i32 %5, 0
  br i1 %73, label %74, label %82

74:                                               ; preds = %72, %74
  %75 = cmpxchg i32 addrspace(1)* %2, i32 0, i32 1 syncscope("agent-one-as") monotonic monotonic, align 4
  %76 = extractvalue { i32, i1 } %75, 1
  br i1 %76, label %77, label %74, !llvm.loop !23

77:                                               ; preds = %74
  %78 = load float, float addrspace(1)* %1, align 4, !tbaa !16
  %79 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 0), align 4, !tbaa !16
  %80 = tail call float @llvm.maxnum.f32(float %78, float %79)
  store float %80, float addrspace(1)* %1, align 4, !tbaa !16
  %81 = atomicrmw xchg i32 addrspace(1)* %2, i32 0 syncscope("agent-one-as") monotonic, align 4
  br label %82

82:                                               ; preds = %77, %72
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
