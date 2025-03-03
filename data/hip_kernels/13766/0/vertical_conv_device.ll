; ModuleID = '../data/hip_kernels/13766/0/main.cu'
source_filename = "../data/hip_kernels/13766/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.pixel = type { i8, i8, i8 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13vertical_convP5pixelS0_iiPfi(%struct.pixel addrspace(1)* nocapture readonly %0, %struct.pixel addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = zext i32 %24 to i64
  %26 = sext i32 %2 to i64
  %27 = mul nsw i64 %25, %26
  %28 = add nsw i64 %27, %16
  %29 = sext i32 %3 to i64
  %30 = icmp ult i64 %25, %29
  %31 = icmp ult i64 %16, %26
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %197

33:                                               ; preds = %6
  %34 = icmp sgt i32 %5, 0
  br i1 %34, label %35, label %100

35:                                               ; preds = %33
  %36 = add i32 %5, -1
  %37 = lshr i32 %36, 1
  %38 = sub i32 %24, %37
  %39 = icmp slt i32 %15, %2
  %40 = and i32 %5, 1
  %41 = icmp eq i32 %36, 0
  br i1 %41, label %44, label %42

42:                                               ; preds = %35
  %43 = and i32 %5, -2
  br label %107

44:                                               ; preds = %176, %35
  %45 = phi float [ undef, %35 ], [ %187, %176 ]
  %46 = phi float [ undef, %35 ], [ %190, %176 ]
  %47 = phi float [ undef, %35 ], [ %193, %176 ]
  %48 = phi float [ 0.000000e+00, %35 ], [ %187, %176 ]
  %49 = phi float [ 0.000000e+00, %35 ], [ %193, %176 ]
  %50 = phi float [ 0.000000e+00, %35 ], [ %190, %176 ]
  %51 = phi i32 [ 0, %35 ], [ %194, %176 ]
  %52 = icmp eq i32 %40, 0
  br i1 %52, label %93, label %53

53:                                               ; preds = %44
  %54 = zext i32 %51 to i64
  %55 = add i32 %38, %51
  br i1 %39, label %56, label %76

56:                                               ; preds = %53
  %57 = icmp slt i32 %55, %3
  %58 = or i32 %55, %15
  %59 = icmp sgt i32 %58, -1
  %60 = select i1 %57, i1 %59, i1 false
  br i1 %60, label %61, label %76

61:                                               ; preds = %56
  %62 = mul nsw i32 %55, %2
  %63 = add nsw i32 %62, %15
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %64, i32 0
  %66 = load i8, i8 addrspace(1)* %65, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %67 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %64, i32 1
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa.struct !11, !amdgpu.noclobber !5
  %69 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %64, i32 2
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa.struct !12, !amdgpu.noclobber !5
  %71 = zext i8 %70 to i32
  %72 = shl nuw nsw i32 %71, 16
  %73 = zext i8 %68 to i32
  %74 = shl nuw nsw i32 %73, 8
  %75 = uitofp i8 %66 to float
  br label %76

76:                                               ; preds = %61, %56, %53
  %77 = phi float [ %75, %61 ], [ 0.000000e+00, %56 ], [ 0.000000e+00, %53 ]
  %78 = phi i32 [ %74, %61 ], [ 0, %56 ], [ 0, %53 ]
  %79 = phi i32 [ %72, %61 ], [ 0, %56 ], [ 0, %53 ]
  %80 = or i32 %79, %78
  %81 = lshr exact i32 %78, 8
  %82 = lshr i32 %80, 16
  %83 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !13, !amdgpu.noclobber !5
  %85 = fmul contract float %84, %77
  %86 = fadd contract float %48, %85
  %87 = sitofp i32 %82 to float
  %88 = fmul contract float %84, %87
  %89 = fadd contract float %50, %88
  %90 = sitofp i32 %81 to float
  %91 = fmul contract float %84, %90
  %92 = fadd contract float %49, %91
  br label %93

93:                                               ; preds = %44, %76
  %94 = phi float [ %45, %44 ], [ %86, %76 ]
  %95 = phi float [ %46, %44 ], [ %89, %76 ]
  %96 = phi float [ %47, %44 ], [ %92, %76 ]
  %97 = fptoui float %94 to i8
  %98 = fptoui float %96 to i8
  %99 = fptoui float %95 to i8
  br label %100

100:                                              ; preds = %93, %33
  %101 = phi i8 [ 0, %33 ], [ %99, %93 ]
  %102 = phi i8 [ 0, %33 ], [ %98, %93 ]
  %103 = phi i8 [ 0, %33 ], [ %97, %93 ]
  %104 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %1, i64 %28, i32 0
  store i8 %103, i8 addrspace(1)* %104, align 1, !tbaa !15
  %105 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %1, i64 %28, i32 1
  store i8 %102, i8 addrspace(1)* %105, align 1, !tbaa !17
  %106 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %1, i64 %28, i32 2
  store i8 %101, i8 addrspace(1)* %106, align 1, !tbaa !18
  br label %197

107:                                              ; preds = %176, %42
  %108 = phi float [ 0.000000e+00, %42 ], [ %187, %176 ]
  %109 = phi float [ 0.000000e+00, %42 ], [ %193, %176 ]
  %110 = phi float [ 0.000000e+00, %42 ], [ %190, %176 ]
  %111 = phi i32 [ 0, %42 ], [ %194, %176 ]
  %112 = phi i32 [ 0, %42 ], [ %195, %176 ]
  %113 = zext i32 %111 to i64
  %114 = add i32 %38, %111
  br i1 %39, label %115, label %135

115:                                              ; preds = %107
  %116 = icmp slt i32 %114, %3
  %117 = or i32 %114, %15
  %118 = icmp sgt i32 %117, -1
  %119 = select i1 %116, i1 %118, i1 false
  br i1 %119, label %120, label %135

120:                                              ; preds = %115
  %121 = mul nsw i32 %114, %2
  %122 = add nsw i32 %121, %15
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %123, i32 0
  %125 = load i8, i8 addrspace(1)* %124, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %126 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %123, i32 1
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa.struct !11, !amdgpu.noclobber !5
  %128 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %123, i32 2
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa.struct !12, !amdgpu.noclobber !5
  %130 = zext i8 %129 to i32
  %131 = shl nuw nsw i32 %130, 16
  %132 = zext i8 %127 to i32
  %133 = shl nuw nsw i32 %132, 8
  %134 = zext i8 %125 to i32
  br label %135

135:                                              ; preds = %107, %115, %120
  %136 = phi i32 [ %134, %120 ], [ 0, %115 ], [ 0, %107 ]
  %137 = phi i32 [ %133, %120 ], [ 0, %115 ], [ 0, %107 ]
  %138 = phi i32 [ %131, %120 ], [ 0, %115 ], [ 0, %107 ]
  %139 = or i32 %138, %137
  %140 = lshr exact i32 %137, 8
  %141 = lshr i32 %139, 16
  %142 = sitofp i32 %136 to float
  %143 = getelementptr inbounds float, float addrspace(1)* %4, i64 %113
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !13, !amdgpu.noclobber !5
  %145 = fmul contract float %144, %142
  %146 = fadd contract float %108, %145
  %147 = sitofp i32 %141 to float
  %148 = fmul contract float %144, %147
  %149 = fadd contract float %110, %148
  %150 = sitofp i32 %140 to float
  %151 = fmul contract float %144, %150
  %152 = fadd contract float %109, %151
  %153 = or i32 %111, 1
  %154 = zext i32 %153 to i64
  %155 = add i32 %38, %153
  br i1 %39, label %156, label %176

156:                                              ; preds = %135
  %157 = icmp slt i32 %155, %3
  %158 = or i32 %155, %15
  %159 = icmp sgt i32 %158, -1
  %160 = select i1 %157, i1 %159, i1 false
  br i1 %160, label %161, label %176

161:                                              ; preds = %156
  %162 = mul nsw i32 %155, %2
  %163 = add nsw i32 %162, %15
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %164, i32 0
  %166 = load i8, i8 addrspace(1)* %165, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %167 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %164, i32 1
  %168 = load i8, i8 addrspace(1)* %167, align 1, !tbaa.struct !11, !amdgpu.noclobber !5
  %169 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %164, i32 2
  %170 = load i8, i8 addrspace(1)* %169, align 1, !tbaa.struct !12, !amdgpu.noclobber !5
  %171 = zext i8 %170 to i32
  %172 = shl nuw nsw i32 %171, 16
  %173 = zext i8 %168 to i32
  %174 = shl nuw nsw i32 %173, 8
  %175 = zext i8 %166 to i32
  br label %176

176:                                              ; preds = %161, %156, %135
  %177 = phi i32 [ %175, %161 ], [ 0, %156 ], [ 0, %135 ]
  %178 = phi i32 [ %174, %161 ], [ 0, %156 ], [ 0, %135 ]
  %179 = phi i32 [ %172, %161 ], [ 0, %156 ], [ 0, %135 ]
  %180 = or i32 %179, %178
  %181 = lshr exact i32 %178, 8
  %182 = lshr i32 %180, 16
  %183 = sitofp i32 %177 to float
  %184 = getelementptr inbounds float, float addrspace(1)* %4, i64 %154
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !13, !amdgpu.noclobber !5
  %186 = fmul contract float %185, %183
  %187 = fadd contract float %146, %186
  %188 = sitofp i32 %182 to float
  %189 = fmul contract float %185, %188
  %190 = fadd contract float %149, %189
  %191 = sitofp i32 %181 to float
  %192 = fmul contract float %185, %191
  %193 = fadd contract float %152, %192
  %194 = add nuw nsw i32 %111, 2
  %195 = add i32 %112, 2
  %196 = icmp eq i32 %195, %43
  br i1 %196, label %44, label %107, !llvm.loop !19

197:                                              ; preds = %100, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{i64 0, i64 1, !8, i64 1, i64 1, !8, i64 2, i64 1, !8}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i64 0, i64 1, !8, i64 1, i64 1, !8}
!12 = !{i64 0, i64 1, !8}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
!15 = !{!16, !9, i64 0}
!16 = !{!"_ZTS5pixel", !9, i64 0, !9, i64 1, !9, i64 2}
!17 = !{!16, !9, i64 1}
!18 = !{!16, !9, i64 2}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
