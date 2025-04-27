; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/12983/4/Subsample_Bilinear_uchar.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/12983/4/Subsample_Bilinear_uchar.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z24Subsample_Bilinear_ucharP13__hip_texturePhiiiii(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %3
  %26 = icmp slt i32 %16, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %127

28:                                               ; preds = %7
  %29 = sitofp i32 %5 to float
  %30 = sitofp i32 %2 to float
  %31 = fdiv contract float %29, %30
  %32 = sitofp i32 %6 to float
  %33 = sitofp i32 %3 to float
  %34 = fdiv contract float %32, %33
  %35 = sitofp i32 %16 to float
  %36 = fadd contract float %35, 5.000000e-01
  %37 = fmul contract float %31, %36
  %38 = sitofp i32 %24 to float
  %39 = fadd contract float %38, 5.000000e-01
  %40 = fmul contract float %34, %39
  %41 = fadd contract float %31, -1.000000e+00
  %42 = fmul contract float %41, 5.000000e-01
  %43 = tail call float @llvm.maxnum.f32(float %42, float 0.000000e+00)
  %44 = tail call float @llvm.minnum.f32(float %43, float 1.000000e+00)
  %45 = fadd contract float %34, -1.000000e+00
  %46 = fmul contract float %45, 5.000000e-01
  %47 = tail call float @llvm.maxnum.f32(float %46, float 0.000000e+00)
  %48 = tail call float @llvm.minnum.f32(float %47, float 1.000000e+00)
  %49 = fadd contract float %44, 5.000000e-01
  %50 = fdiv contract float %44, %49
  %51 = fadd contract float %48, 5.000000e-01
  %52 = fdiv contract float %48, %51
  %53 = fsub contract float %37, %50
  %54 = fsub contract float %40, %52
  %55 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %56 = addrspacecast i32 addrspace(1)* %55 to i32 addrspace(4)*
  %57 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 12
  %58 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 10
  %59 = load i32, i32 addrspace(4)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = uitofp i32 %59 to float
  %61 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 2
  %62 = load i32, i32 addrspace(4)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = lshr i32 %62, 14
  %64 = and i32 %63, 16383
  %65 = add nuw nsw i32 %64, 1
  %66 = uitofp i32 %65 to float
  %67 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = and i32 %67, 32768
  %69 = icmp eq i32 %68, 0
  %70 = select i1 %69, float %60, float 1.000000e+00
  %71 = select i1 %69, float %66, float 1.000000e+00
  %72 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 14
  %73 = load i32, i32 addrspace(4)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = and i32 %73, 1048576
  %75 = icmp eq i32 %74, 0
  %76 = bitcast i32 addrspace(4)* %57 to <4 x i32> addrspace(4)*
  %77 = load <4 x i32>, <4 x i32> addrspace(4)* %76, align 16, !tbaa !11, !amdgpu.noclobber !5
  %78 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %79 = addrspacecast <8 x i32> addrspace(1)* %78 to <8 x i32> addrspace(4)*
  %80 = load <8 x i32>, <8 x i32> addrspace(4)* %79, align 32, !tbaa !11, !amdgpu.noclobber !5
  %81 = tail call float @llvm.amdgcn.rcp.f32(float %71)
  %82 = fmul float %54, %71
  %83 = tail call float @llvm.floor.f32(float %82)
  %84 = fmul float %81, %83
  %85 = select i1 %75, float %84, float %54
  %86 = tail call float @llvm.amdgcn.rcp.f32(float %70)
  %87 = fmul float %53, %70
  %88 = tail call float @llvm.floor.f32(float %87)
  %89 = fmul float %86, %88
  %90 = select i1 %75, float %89, float %53
  %91 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %90, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %92 = bitcast float %91 to i32
  %93 = trunc i32 %92 to i16
  %94 = and i16 %93, 255
  %95 = fadd contract float %50, %37
  %96 = fmul float %95, %70
  %97 = tail call float @llvm.floor.f32(float %96)
  %98 = fmul float %86, %97
  %99 = select i1 %75, float %98, float %95
  %100 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %99, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %101 = bitcast float %100 to i32
  %102 = trunc i32 %101 to i16
  %103 = and i16 %102, 255
  %104 = fadd contract float %52, %40
  %105 = fmul float %104, %71
  %106 = tail call float @llvm.floor.f32(float %105)
  %107 = fmul float %81, %106
  %108 = select i1 %75, float %107, float %104
  %109 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %90, float %108, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %110 = bitcast float %109 to i32
  %111 = trunc i32 %110 to i16
  %112 = and i16 %111, 255
  %113 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %99, float %108, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %114 = bitcast float %113 to i32
  %115 = trunc i32 %114 to i16
  %116 = and i16 %115, 255
  %117 = add nuw nsw i16 %94, 2
  %118 = add nuw nsw i16 %117, %103
  %119 = add nuw nsw i16 %118, %112
  %120 = add nuw nsw i16 %119, %116
  %121 = lshr i16 %120, 2
  %122 = trunc i16 %121 to i8
  %123 = mul nsw i32 %24, %4
  %124 = add nsw i32 %123, %16
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %125
  store i8 %122, i8 addrspace(1)* %126, align 1, !tbaa !12
  br label %127

127:                                              ; preds = %28, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
