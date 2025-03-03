; ModuleID = '../data/hip_kernels/12578/6/main.cu'
source_filename = "../data/hip_kernels/12578/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }
%struct.texture.1 = type { %struct.textureReference }
%struct.texture.2 = type { %struct.textureReference }

@uchar_tex = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@uchar2_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@ushort_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.1 undef, align 8
@ushort2_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.2 undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @uchar_tex to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15Thumbnail_ucharPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %2
  %22 = icmp slt i32 %12, %1
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %70

24:                                               ; preds = %3
  %25 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @uchar_tex, i64 0, i32 0, i32 11), align 8
  %26 = sitofp i32 %12 to float
  %27 = sitofp i32 %20 to float
  %28 = bitcast %struct.__hip_texture* %25 to i32*
  %29 = addrspacecast i32* %28 to i32 addrspace(4)*
  %30 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 12
  %31 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 10
  %32 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !7
  %33 = uitofp i32 %32 to float
  %34 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 2
  %35 = load i32, i32 addrspace(4)* %34, align 4, !tbaa !7
  %36 = lshr i32 %35, 14
  %37 = and i32 %36, 16383
  %38 = add nuw nsw i32 %37, 1
  %39 = uitofp i32 %38 to float
  %40 = load i32, i32 addrspace(4)* %30, align 4, !tbaa !7
  %41 = and i32 %40, 32768
  %42 = icmp eq i32 %41, 0
  %43 = select i1 %42, float %33, float 1.000000e+00
  %44 = select i1 %42, float %39, float 1.000000e+00
  %45 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 14
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7
  %47 = and i32 %46, 1048576
  %48 = icmp eq i32 %47, 0
  %49 = bitcast i32 addrspace(4)* %30 to <4 x i32> addrspace(4)*
  %50 = load <4 x i32>, <4 x i32> addrspace(4)* %49, align 16, !tbaa !11
  %51 = bitcast %struct.__hip_texture* %25 to <8 x i32>*
  %52 = addrspacecast <8 x i32>* %51 to <8 x i32> addrspace(4)*
  %53 = load <8 x i32>, <8 x i32> addrspace(4)* %52, align 32, !tbaa !11
  %54 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %55 = fmul float %44, %27
  %56 = tail call float @llvm.floor.f32(float %55)
  %57 = fmul float %54, %56
  %58 = select i1 %48, float %57, float %27
  %59 = tail call float @llvm.amdgcn.rcp.f32(float %43)
  %60 = fmul float %43, %26
  %61 = tail call float @llvm.floor.f32(float %60)
  %62 = fmul float %59, %61
  %63 = select i1 %48, float %62, float %26
  %64 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %58, <8 x i32> %53, <4 x i32> %50, i1 false, i32 0, i32 0)
  %65 = bitcast float %64 to i32
  %66 = and i32 %65, 255
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = atomicrmw add i32 addrspace(1)* %68, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %70

70:                                               ; preds = %24, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
