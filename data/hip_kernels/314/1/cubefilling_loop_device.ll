; ModuleID = '../data/hip_kernels/314/1/main.cu'
source_filename = "../data/hip_kernels/314/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.dim3 = type { i32, i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16cubefilling_loopPKfPfS1_4dim3iiS2_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, %struct.dim3 addrspace(4)* nocapture readonly byref(%struct.dim3) align 4 %3, i32 %4, i32 %5, %struct.dim3 addrspace(4)* nocapture readonly byref(%struct.dim3) align 4 %6) local_unnamed_addr #0 {
  %8 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %3, i64 0, i32 0
  %9 = load i32, i32 addrspace(4)* %8, align 4, !amdgpu.noclobber !4
  %10 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %3, i64 0, i32 1
  %11 = load i32, i32 addrspace(4)* %10, align 4, !amdgpu.noclobber !4
  %12 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %6, i64 0, i32 0
  %13 = load i32, i32 addrspace(4)* %12, align 4, !amdgpu.noclobber !4
  %14 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %6, i64 0, i32 1
  %15 = load i32, i32 addrspace(4)* %14, align 4, !amdgpu.noclobber !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !4
  %21 = zext i16 %20 to i32
  %22 = mul i32 %16, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %17, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !4
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %32 = add i32 %30, %31
  %33 = icmp ult i32 %24, %13
  %34 = icmp ult i32 %32, %15
  %35 = select i1 %33, i1 %34, i1 false
  %36 = icmp sgt i32 %4, 0
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %81

38:                                               ; preds = %7
  %39 = mul i32 %32, %13
  %40 = add i32 %39, %24
  %41 = mul i32 %24, %4
  %42 = mul i32 %32, %4
  %43 = zext i32 %9 to i64
  %44 = uitofp i32 %40 to float
  %45 = mul i32 %15, %13
  %46 = uitofp i32 %45 to float
  %47 = sitofp i32 %5 to float
  br label %48

48:                                               ; preds = %38, %53
  %49 = phi i32 [ 0, %38 ], [ %54, %53 ]
  %50 = add i32 %49, %41
  %51 = icmp ult i32 %50, %9
  %52 = zext i32 %50 to i64
  br label %56

53:                                               ; preds = %78
  %54 = add nuw nsw i32 %49, 1
  %55 = icmp eq i32 %54, %4
  br i1 %55, label %81, label %48, !llvm.loop !7

56:                                               ; preds = %48, %78
  %57 = phi i32 [ 0, %48 ], [ %79, %78 ]
  %58 = add i32 %57, %42
  %59 = icmp ult i32 %58, %11
  %60 = select i1 %51, i1 %59, i1 false
  br i1 %60, label %61, label %78

61:                                               ; preds = %56
  %62 = zext i32 %58 to i64
  %63 = mul nuw i64 %62, %43
  %64 = add nuw i64 %63, %52
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !10
  %67 = fdiv contract float %66, %47
  %68 = tail call float @llvm.floor.f32(float %67)
  %69 = fmul contract float %68, %46
  %70 = fadd contract float %69, %44
  %71 = fptoui float %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !10
  %74 = fadd contract float %66, %73
  store float %74, float addrspace(1)* %72, align 4, !tbaa !10
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !10
  %77 = fadd contract float %76, 1.000000e+00
  store float %77, float addrspace(1)* %75, align 4, !tbaa !10
  br label %78

78:                                               ; preds = %61, %56
  %79 = add nuw nsw i32 %57, 1
  %80 = icmp eq i32 %79, %4
  br i1 %80, label %53, label %56, !llvm.loop !14

81:                                               ; preds = %53, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{}
!5 = !{i16 1, i16 1025}
!6 = !{i32 0, i32 1024}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.enable"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C++ TBAA"}
!14 = distinct !{!14, !8, !9}
