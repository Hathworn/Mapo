; ModuleID = '../data/hip_kernels/12578/2/main.cu'
source_filename = "../data/hip_kernels/12578/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }
%struct.texture.1 = type { %struct.textureReference }
%struct.texture.2 = type { %struct.textureReference }
%struct.texture.3 = type { %struct.textureReference }
%struct.texture.4 = type { %struct.textureReference }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

@uchar_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@uchar2_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@uchar4_tex = protected addrspace(1) externally_initialized global %struct.texture.1 undef, align 8
@ushort_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.2 undef, align 8
@ushort2_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.3 undef, align 8
@ushort4_tex = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.4 undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture.1 addrspace(1)* @uchar4_tex to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z25Subsample_Bilinear_uchar4P15HIP_vector_typeIhLj4EEiiiii(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %2
  %25 = icmp slt i32 %15, %1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %173

27:                                               ; preds = %6
  %28 = sitofp i32 %4 to float
  %29 = sitofp i32 %1 to float
  %30 = fdiv contract float %28, %29
  %31 = sitofp i32 %5 to float
  %32 = sitofp i32 %2 to float
  %33 = fdiv contract float %31, %32
  %34 = sitofp i32 %15 to float
  %35 = fadd contract float %34, 5.000000e-01
  %36 = fmul contract float %30, %35
  %37 = sitofp i32 %23 to float
  %38 = fadd contract float %37, 5.000000e-01
  %39 = fmul contract float %33, %38
  %40 = fadd contract float %30, -1.000000e+00
  %41 = fmul contract float %40, 5.000000e-01
  %42 = tail call float @llvm.maxnum.f32(float %41, float 0.000000e+00)
  %43 = tail call float @llvm.minnum.f32(float %42, float 1.000000e+00)
  %44 = fadd contract float %33, -1.000000e+00
  %45 = fmul contract float %44, 5.000000e-01
  %46 = tail call float @llvm.maxnum.f32(float %45, float 0.000000e+00)
  %47 = tail call float @llvm.minnum.f32(float %46, float 1.000000e+00)
  %48 = fadd contract float %43, 5.000000e-01
  %49 = fdiv contract float %43, %48
  %50 = fadd contract float %47, 5.000000e-01
  %51 = fdiv contract float %47, %50
  %52 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture.1, %struct.texture.1 addrspace(1)* @uchar4_tex, i64 0, i32 0, i32 11), align 8
  %53 = fsub contract float %36, %49
  %54 = fsub contract float %39, %51
  %55 = bitcast %struct.__hip_texture* %52 to i32*
  %56 = addrspacecast i32* %55 to i32 addrspace(4)*
  %57 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 12
  %58 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 10
  %59 = load i32, i32 addrspace(4)* %58, align 4, !tbaa !7
  %60 = uitofp i32 %59 to float
  %61 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 2
  %62 = load i32, i32 addrspace(4)* %61, align 4, !tbaa !7
  %63 = lshr i32 %62, 14
  %64 = and i32 %63, 16383
  %65 = add nuw nsw i32 %64, 1
  %66 = uitofp i32 %65 to float
  %67 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !7
  %68 = and i32 %67, 32768
  %69 = icmp eq i32 %68, 0
  %70 = select i1 %69, float %60, float 1.000000e+00
  %71 = select i1 %69, float %66, float 1.000000e+00
  %72 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 14
  %73 = load i32, i32 addrspace(4)* %72, align 4, !tbaa !7
  %74 = and i32 %73, 1048576
  %75 = icmp eq i32 %74, 0
  %76 = bitcast i32 addrspace(4)* %57 to <4 x i32> addrspace(4)*
  %77 = load <4 x i32>, <4 x i32> addrspace(4)* %76, align 16, !tbaa !11
  %78 = bitcast %struct.__hip_texture* %52 to <8 x i32>*
  %79 = addrspacecast <8 x i32>* %78 to <8 x i32> addrspace(4)*
  %80 = load <8 x i32>, <8 x i32> addrspace(4)* %79, align 32, !tbaa !11
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
  %91 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %90, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %92 = bitcast <4 x float> %91 to <16 x i8>
  %93 = shufflevector <16 x i8> %92, <16 x i8> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %94 = bitcast <4 x i8> %93 to i32
  %95 = lshr i32 %94, 8
  %96 = lshr i32 %94, 16
  %97 = lshr i32 %94, 24
  %98 = fadd contract float %49, %36
  %99 = fmul float %98, %70
  %100 = tail call float @llvm.floor.f32(float %99)
  %101 = fmul float %86, %100
  %102 = select i1 %75, float %101, float %98
  %103 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %102, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %104 = bitcast <4 x float> %103 to <16 x i8>
  %105 = shufflevector <16 x i8> %104, <16 x i8> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %106 = bitcast <4 x i8> %105 to i32
  %107 = lshr i32 %106, 8
  %108 = lshr i32 %106, 16
  %109 = lshr i32 %106, 24
  %110 = fadd contract float %51, %39
  %111 = fmul float %110, %71
  %112 = tail call float @llvm.floor.f32(float %111)
  %113 = fmul float %81, %112
  %114 = select i1 %75, float %113, float %110
  %115 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %90, float %114, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %116 = bitcast <4 x float> %115 to <16 x i8>
  %117 = shufflevector <16 x i8> %116, <16 x i8> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %118 = bitcast <4 x i8> %117 to i32
  %119 = lshr i32 %118, 8
  %120 = lshr i32 %118, 16
  %121 = lshr i32 %118, 24
  %122 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %102, float %114, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %123 = bitcast <4 x float> %122 to <16 x i8>
  %124 = shufflevector <16 x i8> %123, <16 x i8> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %125 = bitcast <4 x i8> %124 to i32
  %126 = lshr i32 %125, 8
  %127 = lshr i32 %125, 16
  %128 = lshr i32 %125, 24
  %129 = and i32 %94, 255
  %130 = and i32 %106, 255
  %131 = and i32 %118, 255
  %132 = and i32 %125, 255
  %133 = add nuw nsw i32 %129, 2
  %134 = add nuw nsw i32 %133, %130
  %135 = add nuw nsw i32 %134, %131
  %136 = add nuw nsw i32 %135, %132
  %137 = lshr i32 %136, 2
  %138 = and i32 %95, 255
  %139 = and i32 %107, 255
  %140 = and i32 %119, 255
  %141 = and i32 %126, 255
  %142 = add nuw nsw i32 %138, 2
  %143 = add nuw nsw i32 %142, %139
  %144 = add nuw nsw i32 %143, %140
  %145 = add nuw nsw i32 %144, %141
  %146 = lshr i32 %145, 2
  %147 = and i32 %96, 255
  %148 = and i32 %108, 255
  %149 = and i32 %120, 255
  %150 = and i32 %127, 255
  %151 = add nuw nsw i32 %147, 2
  %152 = add nuw nsw i32 %151, %148
  %153 = add nuw nsw i32 %152, %149
  %154 = add nuw nsw i32 %153, %150
  %155 = lshr i32 %154, 2
  %156 = add nuw nsw i32 %97, 2
  %157 = add nuw nsw i32 %156, %109
  %158 = add nuw nsw i32 %157, %121
  %159 = add nuw nsw i32 %158, %128
  %160 = lshr i32 %159, 2
  %161 = trunc i32 %137 to i8
  %162 = trunc i32 %146 to i8
  %163 = trunc i32 %155 to i8
  %164 = trunc i32 %160 to i8
  %165 = insertelement <4 x i8> undef, i8 %161, i64 0
  %166 = insertelement <4 x i8> %165, i8 %162, i64 1
  %167 = insertelement <4 x i8> %166, i8 %163, i64 2
  %168 = insertelement <4 x i8> %167, i8 %164, i64 3
  %169 = mul nsw i32 %23, %3
  %170 = add nsw i32 %169, %15
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %171, i32 0, i32 0, i32 0
  store <4 x i8> %168, <4 x i8> addrspace(1)* %172, align 4
  br label %173

173:                                              ; preds = %27, %6
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

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nounwind readonly willreturn }

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
