; ModuleID = '../data/hip_kernels/11876/36/main.cu'
source_filename = "../data/hip_kernels/11876/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_ncases = protected addrspace(4) externally_initialized global i32 0, align 4
@d_ntarg = protected addrspace(4) externally_initialized global i32 0, align 4
@d_targets = protected addrspace(4) externally_initialized global float* null, align 8
@d_output = protected addrspace(4) externally_initialized global double* null, align 8
@d_mse_out = protected addrspace(4) externally_initialized global float* null, align 8
@_ZZ10device_msevE11partial_mse = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [5 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_mse_out to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_ncases to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_ntarg to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double* addrspace(4)* @d_output to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_targets to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10device_msev() local_unnamed_addr #0 {
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %2 = load i32, i32 addrspace(4)* @d_ncases, align 4, !tbaa !5
  %3 = load i32, i32 addrspace(4)* @d_ntarg, align 4, !tbaa !5
  %4 = mul nsw i32 %3, %2
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !9, !invariant.load !10
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !11
  %14 = mul i32 %5, %10
  %15 = add i32 %14, %1
  %16 = icmp ult i32 %15, %4
  br i1 %16, label %17, label %40

17:                                               ; preds = %0
  %18 = load double*, double* addrspace(4)* @d_output, align 8, !tbaa !20
  %19 = load float*, float* addrspace(4)* @d_targets, align 8, !tbaa !20
  %20 = udiv i32 %13, %10
  %21 = mul i32 %20, %10
  %22 = icmp ugt i32 %13, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %10
  br label %26

26:                                               ; preds = %17, %26
  %27 = phi double [ 0.000000e+00, %17 ], [ %37, %26 ]
  %28 = phi i32 [ %15, %17 ], [ %38, %26 ]
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double* %18, i64 %29
  %31 = load double, double* %30, align 8, !tbaa !22
  %32 = getelementptr inbounds float, float* %19, i64 %29
  %33 = load float, float* %32, align 4, !tbaa !24
  %34 = fpext float %33 to double
  %35 = fsub contract double %31, %34
  %36 = fmul contract double %35, %35
  %37 = fadd contract double %27, %36
  %38 = add i32 %25, %28
  %39 = icmp ult i32 %38, %4
  br i1 %39, label %26, label %40, !llvm.loop !26

40:                                               ; preds = %26, %0
  %41 = phi double [ 0.000000e+00, %0 ], [ %37, %26 ]
  %42 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ10device_msevE11partial_mse, i32 0, i32 %1
  store double %41, double addrspace(3)* %42, align 8, !tbaa !22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ult i16 %9, 2
  br i1 %43, label %56, label %44

44:                                               ; preds = %40, %54
  %45 = phi i32 [ %46, %54 ], [ %10, %40 ]
  %46 = lshr i32 %45, 1
  %47 = icmp ult i32 %1, %46
  br i1 %47, label %48, label %54

48:                                               ; preds = %44
  %49 = add nuw nsw i32 %46, %1
  %50 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ10device_msevE11partial_mse, i32 0, i32 %49
  %51 = load double, double addrspace(3)* %50, align 8, !tbaa !22
  %52 = load double, double addrspace(3)* %42, align 8, !tbaa !22
  %53 = fadd contract double %51, %52
  store double %53, double addrspace(3)* %42, align 8, !tbaa !22
  br label %54

54:                                               ; preds = %48, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = icmp ult i32 %45, 4
  br i1 %55, label %56, label %44, !llvm.loop !28

56:                                               ; preds = %54, %40
  %57 = icmp eq i32 %1, 0
  br i1 %57, label %58, label %64

58:                                               ; preds = %56
  %59 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ10device_msevE11partial_mse, i32 0, i32 0), align 16, !tbaa !22
  %60 = fptrunc double %59 to float
  %61 = load float*, float* addrspace(4)* @d_mse_out, align 8, !tbaa !20
  %62 = zext i32 %5 to i64
  %63 = getelementptr inbounds float, float* %61, i64 %62
  store float %60, float* %63, align 4, !tbaa !24
  br label %64

64:                                               ; preds = %58, %56
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !7, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"double", !7, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"float", !7, i64 0}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.mustprogress"}
!28 = distinct !{!28, !27}
