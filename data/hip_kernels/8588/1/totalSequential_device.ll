; ModuleID = '../data/hip_kernels/8588/1/main.cu'
source_filename = "../data/hip_kernels/8588/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15totalSequentialPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = icmp eq i32 %4, 0
  br i1 %12, label %13, label %112

13:                                               ; preds = %3
  %14 = and i32 %10, 7
  %15 = icmp ult i16 %9, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %13
  %17 = and i32 %10, 2040
  br label %42

18:                                               ; preds = %42, %13
  %19 = phi i32 [ undef, %13 ], [ %108, %42 ]
  %20 = phi i32 [ 0, %13 ], [ %109, %42 ]
  %21 = phi i32 [ 0, %13 ], [ %108, %42 ]
  %22 = icmp eq i32 %14, 0
  br i1 %22, label %37, label %23

23:                                               ; preds = %18, %23
  %24 = phi i32 [ %34, %23 ], [ %20, %18 ]
  %25 = phi i32 [ %33, %23 ], [ %21, %18 ]
  %26 = phi i32 [ %35, %23 ], [ 0, %18 ]
  %27 = add i32 %24, %11
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = sitofp i32 %25 to float
  %32 = fadd contract float %30, %31
  %33 = fptosi float %32 to i32
  %34 = add nuw nsw i32 %24, 1
  %35 = add i32 %26, 1
  %36 = icmp eq i32 %35, %14
  br i1 %36, label %37, label %23, !llvm.loop !11

37:                                               ; preds = %23, %18
  %38 = phi i32 [ %19, %18 ], [ %33, %23 ]
  %39 = sitofp i32 %38 to float
  %40 = zext i32 %5 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  store float %39, float addrspace(1)* %41, align 4, !tbaa !7
  br label %112

42:                                               ; preds = %42, %16
  %43 = phi i32 [ 0, %16 ], [ %109, %42 ]
  %44 = phi i32 [ 0, %16 ], [ %108, %42 ]
  %45 = phi i32 [ 0, %16 ], [ %110, %42 ]
  %46 = add i32 %43, %11
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = sitofp i32 %44 to float
  %51 = fadd contract float %49, %50
  %52 = fptosi float %51 to i32
  %53 = or i32 %43, 1
  %54 = add i32 %53, %11
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  %58 = sitofp i32 %52 to float
  %59 = fadd contract float %57, %58
  %60 = fptosi float %59 to i32
  %61 = or i32 %43, 2
  %62 = add i32 %61, %11
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = sitofp i32 %60 to float
  %67 = fadd contract float %65, %66
  %68 = fptosi float %67 to i32
  %69 = or i32 %43, 3
  %70 = add i32 %69, %11
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = sitofp i32 %68 to float
  %75 = fadd contract float %73, %74
  %76 = fptosi float %75 to i32
  %77 = or i32 %43, 4
  %78 = add i32 %77, %11
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = sitofp i32 %76 to float
  %83 = fadd contract float %81, %82
  %84 = fptosi float %83 to i32
  %85 = or i32 %43, 5
  %86 = add i32 %85, %11
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = sitofp i32 %84 to float
  %91 = fadd contract float %89, %90
  %92 = fptosi float %91 to i32
  %93 = or i32 %43, 6
  %94 = add i32 %93, %11
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = sitofp i32 %92 to float
  %99 = fadd contract float %97, %98
  %100 = fptosi float %99 to i32
  %101 = or i32 %43, 7
  %102 = add i32 %101, %11
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = sitofp i32 %100 to float
  %107 = fadd contract float %105, %106
  %108 = fptosi float %107 to i32
  %109 = add nuw nsw i32 %43, 8
  %110 = add i32 %45, 8
  %111 = icmp eq i32 %110, %17
  br i1 %111, label %18, label %42, !llvm.loop !13

112:                                              ; preds = %37, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
