; ModuleID = '../data/hip_kernels/3718/1/main.cu'
source_filename = "../data/hip_kernels/3718/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }

@tcExpData = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@tfG = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20create_bin_expimagesPcPKiPKfiiS1_S1_S1_S1_i(i8 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %9
  br i1 %20, label %21, label %51

21:                                               ; preds = %10
  %22 = sext i32 %19 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %22
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = mul nsw i32 %24, 19
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !11, !amdgpu.noclobber !5
  %34 = fptosi float %33 to i32
  %35 = add nsw i32 %30, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !11, !amdgpu.noclobber !5
  %39 = fptosi float %38 to i32
  %40 = mul i32 %29, %39
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %22
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %22
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = add i32 %40, %42
  %46 = mul i32 %45, %34
  %47 = add i32 %44, %27
  %48 = add i32 %47, %46
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %49
  store i8 1, i8 addrspace(1)* %50, align 1, !tbaa !13
  br label %51

51:                                               ; preds = %21, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = !{!9, !9, i64 0}
