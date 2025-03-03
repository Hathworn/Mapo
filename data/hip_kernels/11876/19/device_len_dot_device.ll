; ModuleID = '../data/hip_kernels/11876/19/main.cu'
source_filename = "../data/hip_kernels/11876/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_n_inputs_cols = protected addrspace(4) externally_initialized global i32 0, align 4
@d_nhid = protected addrspace(4) externally_initialized global i32 0, align 4
@d_w_grad = protected addrspace(4) externally_initialized global float* null, align 8
@d_prev_grad = protected addrspace(4) externally_initialized global float* null, align 8
@d_len_out = protected addrspace(4) externally_initialized global float* null, align 8
@d_dot_out = protected addrspace(4) externally_initialized global float* null, align 8
@_ZZ14device_len_dotvE11partial_len = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16
@_ZZ14device_len_dotvE11partial_dot = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [6 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_dot_out to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_len_out to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_n_inputs_cols to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_nhid to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_prev_grad to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_w_grad to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14device_len_dotv() local_unnamed_addr #0 {
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %2 = load i32, i32 addrspace(4)* @d_n_inputs_cols, align 4, !tbaa !5
  %3 = load i32, i32 addrspace(4)* @d_nhid, align 4, !tbaa !5
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
  %16 = icmp slt i32 %15, %4
  br i1 %16, label %17, label %41

17:                                               ; preds = %0
  %18 = load float*, float* addrspace(4)* @d_w_grad, align 8, !tbaa !20
  %19 = load float*, float* addrspace(4)* @d_prev_grad, align 8, !tbaa !20
  %20 = udiv i32 %13, %10
  %21 = mul i32 %20, %10
  %22 = icmp ugt i32 %13, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %10
  br label %26

26:                                               ; preds = %17, %26
  %27 = phi float [ 0.000000e+00, %17 ], [ %38, %26 ]
  %28 = phi float [ 0.000000e+00, %17 ], [ %34, %26 ]
  %29 = phi i32 [ %15, %17 ], [ %39, %26 ]
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float* %18, i64 %30
  %32 = load float, float* %31, align 4, !tbaa !22
  %33 = fmul contract float %32, %32
  %34 = fadd contract float %28, %33
  %35 = getelementptr inbounds float, float* %19, i64 %30
  %36 = load float, float* %35, align 4, !tbaa !22
  %37 = fmul contract float %32, %36
  %38 = fadd contract float %27, %37
  store float %32, float* %35, align 4, !tbaa !22
  %39 = add i32 %25, %29
  %40 = icmp slt i32 %39, %4
  br i1 %40, label %26, label %41, !llvm.loop !24

41:                                               ; preds = %26, %0
  %42 = phi float [ 0.000000e+00, %0 ], [ %34, %26 ]
  %43 = phi float [ 0.000000e+00, %0 ], [ %38, %26 ]
  %44 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14device_len_dotvE11partial_len, i32 0, i32 %1
  store float %42, float addrspace(3)* %44, align 4, !tbaa !22
  %45 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14device_len_dotvE11partial_dot, i32 0, i32 %1
  store float %43, float addrspace(3)* %45, align 4, !tbaa !22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ult i16 %9, 2
  br i1 %46, label %63, label %47

47:                                               ; preds = %41, %61
  %48 = phi i32 [ %49, %61 ], [ %10, %41 ]
  %49 = lshr i32 %48, 1
  %50 = icmp ult i32 %1, %49
  br i1 %50, label %51, label %61

51:                                               ; preds = %47
  %52 = add nuw nsw i32 %49, %1
  %53 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14device_len_dotvE11partial_len, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !22
  %55 = load float, float addrspace(3)* %44, align 4, !tbaa !22
  %56 = fadd contract float %54, %55
  store float %56, float addrspace(3)* %44, align 4, !tbaa !22
  %57 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14device_len_dotvE11partial_dot, i32 0, i32 %52
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !22
  %59 = load float, float addrspace(3)* %45, align 4, !tbaa !22
  %60 = fadd contract float %58, %59
  store float %60, float addrspace(3)* %45, align 4, !tbaa !22
  br label %61

61:                                               ; preds = %51, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp ult i32 %48, 4
  br i1 %62, label %63, label %47, !llvm.loop !26

63:                                               ; preds = %61, %41
  %64 = icmp eq i32 %1, 0
  br i1 %64, label %65, label %73

65:                                               ; preds = %63
  %66 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ14device_len_dotvE11partial_len, i32 0, i32 0), align 16, !tbaa !22
  %67 = load float*, float* addrspace(4)* @d_len_out, align 8, !tbaa !20
  %68 = zext i32 %5 to i64
  %69 = getelementptr inbounds float, float* %67, i64 %68
  store float %66, float* %69, align 4, !tbaa !22
  %70 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ14device_len_dotvE11partial_dot, i32 0, i32 0), align 16, !tbaa !22
  %71 = load float*, float* addrspace(4)* @d_dot_out, align 8, !tbaa !20
  %72 = getelementptr inbounds float, float* %71, i64 %68
  store float %70, float* %72, align 4, !tbaa !22
  br label %73

73:                                               ; preds = %65, %63
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
!23 = !{!"float", !7, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
