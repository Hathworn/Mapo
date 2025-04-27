; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/12983/9/Subsample_Bilinear_ushort4.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/12983/9/Subsample_Bilinear_ushort4.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i16> }

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z26Subsample_Bilinear_ushort4P13__hip_textureP15HIP_vector_typeItLj4EEiiiii(%struct.__hip_texture addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %27, label %28, label %182

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
  %91 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %90, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %92 = bitcast <4 x float> %91 to <8 x i16>
  %93 = shufflevector <8 x i16> %92, <8 x i16> poison, <4 x i32> <i32 0, i32 2, i32 undef, i32 undef>
  %94 = shufflevector <8 x i16> %92, <8 x i16> poison, <2 x i32> <i32 4, i32 6>
  %95 = bitcast <4 x i16> %93 to <2 x i32>
  %96 = extractelement <2 x i32> %95, i64 0
  %97 = bitcast <2 x i16> %94 to i32
  %98 = fadd contract float %50, %37
  %99 = fmul float %98, %70
  %100 = tail call float @llvm.floor.f32(float %99)
  %101 = fmul float %86, %100
  %102 = select i1 %75, float %101, float %98
  %103 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %102, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %104 = bitcast <4 x float> %103 to <8 x i16>
  %105 = shufflevector <8 x i16> %104, <8 x i16> poison, <4 x i32> <i32 0, i32 2, i32 undef, i32 undef>
  %106 = shufflevector <8 x i16> %104, <8 x i16> poison, <2 x i32> <i32 4, i32 6>
  %107 = bitcast <4 x i16> %105 to <2 x i32>
  %108 = extractelement <2 x i32> %107, i64 0
  %109 = bitcast <2 x i16> %106 to i32
  %110 = fadd contract float %52, %40
  %111 = fmul float %110, %71
  %112 = tail call float @llvm.floor.f32(float %111)
  %113 = fmul float %81, %112
  %114 = select i1 %75, float %113, float %110
  %115 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %90, float %114, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %116 = bitcast <4 x float> %115 to <8 x i16>
  %117 = shufflevector <8 x i16> %116, <8 x i16> poison, <4 x i32> <i32 0, i32 2, i32 undef, i32 undef>
  %118 = shufflevector <8 x i16> %116, <8 x i16> poison, <2 x i32> <i32 4, i32 6>
  %119 = bitcast <4 x i16> %117 to <2 x i32>
  %120 = extractelement <2 x i32> %119, i64 0
  %121 = bitcast <2 x i16> %118 to i32
  %122 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %102, float %114, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %123 = bitcast <4 x float> %122 to <8 x i16>
  %124 = shufflevector <8 x i16> %123, <8 x i16> poison, <4 x i32> <i32 0, i32 2, i32 undef, i32 undef>
  %125 = shufflevector <8 x i16> %123, <8 x i16> poison, <2 x i32> <i32 4, i32 6>
  %126 = bitcast <4 x i16> %124 to <2 x i32>
  %127 = extractelement <2 x i32> %126, i64 0
  %128 = bitcast <2 x i16> %125 to i32
  %129 = and i32 %96, 65535
  %130 = and i32 %108, 65535
  %131 = and i32 %120, 65535
  %132 = and i32 %127, 65535
  %133 = add nuw nsw i32 %129, 2
  %134 = add nuw nsw i32 %133, %130
  %135 = add nuw nsw i32 %134, %131
  %136 = add nuw nsw i32 %135, %132
  %137 = lshr i32 %136, 2
  %138 = lshr i32 %96, 16
  %139 = lshr i32 %108, 16
  %140 = lshr i32 %120, 16
  %141 = lshr i32 %127, 16
  %142 = add nuw nsw i32 %138, 2
  %143 = add nuw nsw i32 %142, %139
  %144 = add nuw nsw i32 %143, %140
  %145 = add nuw nsw i32 %144, %141
  %146 = lshr i32 %145, 2
  %147 = and i32 %97, 65535
  %148 = and i32 %109, 65535
  %149 = and i32 %121, 65535
  %150 = and i32 %128, 65535
  %151 = add nuw nsw i32 %147, 2
  %152 = add nuw nsw i32 %151, %148
  %153 = add nuw nsw i32 %152, %149
  %154 = add nuw nsw i32 %153, %150
  %155 = lshr i32 %154, 2
  %156 = lshr i32 %97, 16
  %157 = lshr i32 %109, 16
  %158 = lshr i32 %121, 16
  %159 = lshr i32 %128, 16
  %160 = add nuw nsw i32 %156, 2
  %161 = add nuw nsw i32 %160, %157
  %162 = add nuw nsw i32 %161, %158
  %163 = add nuw nsw i32 %162, %159
  %164 = lshr i32 %163, 2
  %165 = trunc i32 %137 to i16
  %166 = trunc i32 %146 to i16
  %167 = trunc i32 %155 to i16
  %168 = trunc i32 %164 to i16
  %169 = insertelement <4 x i16> undef, i16 %165, i64 0
  %170 = insertelement <4 x i16> %169, i16 %166, i64 1
  %171 = insertelement <2 x i16> undef, i16 %167, i64 0
  %172 = insertelement <2 x i16> %171, i16 %168, i64 1
  %173 = bitcast <4 x i16> %170 to <2 x i32>
  %174 = extractelement <2 x i32> %173, i64 0
  %175 = mul nsw i32 %24, %4
  %176 = add nsw i32 %175, %16
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %177
  %179 = bitcast %struct.HIP_vector_type addrspace(1)* %178 to i32 addrspace(1)*
  store i32 %174, i32 addrspace(1)* %179, align 8
  %180 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %177, i32 0, i32 0, i32 0, i64 2
  %181 = bitcast i16 addrspace(1)* %180 to <2 x i16> addrspace(1)*
  store <2 x i16> %172, <2 x i16> addrspace(1)* %181, align 4
  br label %182

182:                                              ; preds = %28, %7
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
