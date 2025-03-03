; ModuleID = '../data/hip_kernels/161/7/main.cu'
source_filename = "../data/hip_kernels/161/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20canberra_kernel_samePKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20canberra_kernel_samePKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readnone %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp eq i32 %11, %13
  %16 = icmp ult i64 %12, %2
  %17 = select i1 %15, i1 %16, i1 false
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %17, i1 %19, i1 false
  br i1 %20, label %21, label %25

21:                                               ; preds = %10
  %22 = mul i64 %14, %8
  %23 = add i64 %22, %12
  %24 = getelementptr inbounds float, float addrspace(1)* %7, i64 %23
  store float 0.000000e+00, float addrspace(1)* %24, align 4, !tbaa !4
  br label %25

25:                                               ; preds = %21, %10
  %26 = icmp ult i64 %14, %2
  %27 = icmp ult i32 %11, %13
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %94

29:                                               ; preds = %25
  %30 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ20canberra_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %30, align 4, !tbaa !4
  %31 = zext i32 %18 to i64
  %32 = icmp ult i64 %31, %6
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %43

35:                                               ; preds = %29
  %36 = mul i64 %12, %1
  %37 = mul i64 %14, %1
  %38 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %39 = getelementptr i8, i8 addrspace(4)* %38, i64 4
  %40 = bitcast i8 addrspace(4)* %39 to i16 addrspace(4)*
  %41 = load i16, i16 addrspace(4)* %40, align 4, !range !8, !invariant.load !9
  %42 = zext i16 %41 to i64
  br label %52

43:                                               ; preds = %68, %33
  %44 = phi i8 addrspace(4)* [ %34, %33 ], [ %38, %68 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = getelementptr i8, i8 addrspace(4)* %44, i64 4
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 4, !range !8, !invariant.load !9
  %48 = icmp ult i16 %47, 2
  br i1 %48, label %72, label %49

49:                                               ; preds = %43
  %50 = lshr i16 %47, 1
  %51 = zext i16 %50 to i64
  br label %73

52:                                               ; preds = %35, %68
  %53 = phi float [ 0.000000e+00, %35 ], [ %69, %68 ]
  %54 = phi i64 [ %31, %35 ], [ %70, %68 ]
  %55 = add i64 %54, %36
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !4
  %58 = add i64 %54, %37
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !4
  %61 = fadd contract float %57, %60
  %62 = fcmp contract une float %61, 0.000000e+00
  br i1 %62, label %63, label %68

63:                                               ; preds = %52
  %64 = fsub contract float %57, %60
  %65 = fdiv contract float %64, %61
  %66 = tail call contract float @llvm.fabs.f32(float %65)
  %67 = fadd contract float %66, %53
  store float %67, float addrspace(3)* %30, align 4, !tbaa !4
  br label %68

68:                                               ; preds = %63, %52
  %69 = phi float [ %67, %63 ], [ %53, %52 ]
  %70 = add i64 %54, %42
  %71 = icmp ult i64 %70, %6
  br i1 %71, label %52, label %43, !llvm.loop !10

72:                                               ; preds = %83, %43
  br i1 %19, label %86, label %94

73:                                               ; preds = %49, %83
  %74 = phi i64 [ %84, %83 ], [ %51, %49 ]
  %75 = icmp ugt i64 %74, %31
  br i1 %75, label %76, label %83

76:                                               ; preds = %73
  %77 = trunc i64 %74 to i32
  %78 = add nuw nsw i32 %18, %77
  %79 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ20canberra_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !4
  %81 = load float, float addrspace(3)* %30, align 4, !tbaa !4
  %82 = fadd contract float %80, %81
  store float %82, float addrspace(3)* %30, align 4, !tbaa !4
  br label %83

83:                                               ; preds = %76, %73
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = lshr i64 %74, 1
  %85 = icmp ult i64 %74, 2
  br i1 %85, label %72, label %73, !llvm.loop !12

86:                                               ; preds = %72
  %87 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ20canberra_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !4
  %88 = mul i64 %14, %8
  %89 = add i64 %88, %12
  %90 = getelementptr inbounds float, float addrspace(1)* %7, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !4
  %91 = mul i64 %12, %8
  %92 = add i64 %91, %14
  %93 = getelementptr inbounds float, float addrspace(1)* %7, i64 %92
  store float %87, float addrspace(1)* %93, align 4, !tbaa !4
  br label %94

94:                                               ; preds = %72, %86, %25
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
