; ModuleID = '../data/hip_kernels/13766/1/main.cu'
source_filename = "../data/hip_kernels/13766/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.pixel = type { i8, i8, i8 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15horizontal_convP5pixelS0_iiPfi(%struct.pixel addrspace(1)* nocapture readonly %0, %struct.pixel addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
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
  br i1 %32, label %33, label %195

33:                                               ; preds = %6
  %34 = icmp sgt i32 %5, 0
  br i1 %34, label %35, label %100

35:                                               ; preds = %33
  %36 = add nsw i32 %5, -1
  %37 = lshr i32 %36, 1
  %38 = sub i32 %15, %37
  %39 = icmp slt i32 %24, %3
  %40 = mul nsw i32 %24, %2
  %41 = and i32 %5, 1
  %42 = icmp eq i32 %36, 0
  br i1 %42, label %45, label %43

43:                                               ; preds = %35
  %44 = and i32 %5, -2
  br label %107

45:                                               ; preds = %174, %35
  %46 = phi float [ undef, %35 ], [ %185, %174 ]
  %47 = phi float [ undef, %35 ], [ %188, %174 ]
  %48 = phi float [ undef, %35 ], [ %191, %174 ]
  %49 = phi float [ 0.000000e+00, %35 ], [ %185, %174 ]
  %50 = phi float [ 0.000000e+00, %35 ], [ %191, %174 ]
  %51 = phi float [ 0.000000e+00, %35 ], [ %188, %174 ]
  %52 = phi i32 [ 0, %35 ], [ %192, %174 ]
  %53 = icmp eq i32 %41, 0
  br i1 %53, label %93, label %54

54:                                               ; preds = %45
  %55 = zext i32 %52 to i64
  %56 = add i32 %38, %52
  %57 = icmp slt i32 %56, %2
  br i1 %57, label %58, label %76

58:                                               ; preds = %54
  %59 = or i32 %56, %24
  %60 = icmp sgt i32 %59, -1
  %61 = select i1 %39, i1 %60, i1 false
  br i1 %61, label %62, label %76

62:                                               ; preds = %58
  %63 = add nsw i32 %56, %40
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

76:                                               ; preds = %62, %58, %54
  %77 = phi float [ %75, %62 ], [ 0.000000e+00, %58 ], [ 0.000000e+00, %54 ]
  %78 = phi i32 [ %74, %62 ], [ 0, %58 ], [ 0, %54 ]
  %79 = phi i32 [ %72, %62 ], [ 0, %58 ], [ 0, %54 ]
  %80 = or i32 %79, %78
  %81 = lshr exact i32 %78, 8
  %82 = lshr i32 %80, 16
  %83 = getelementptr inbounds float, float addrspace(1)* %4, i64 %55
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !13, !amdgpu.noclobber !5
  %85 = fmul contract float %84, %77
  %86 = fadd contract float %49, %85
  %87 = sitofp i32 %81 to float
  %88 = fmul contract float %84, %87
  %89 = fadd contract float %51, %88
  %90 = sitofp i32 %82 to float
  %91 = fmul contract float %84, %90
  %92 = fadd contract float %50, %91
  br label %93

93:                                               ; preds = %45, %76
  %94 = phi float [ %46, %45 ], [ %86, %76 ]
  %95 = phi float [ %47, %45 ], [ %89, %76 ]
  %96 = phi float [ %48, %45 ], [ %92, %76 ]
  %97 = fptoui float %94 to i8
  %98 = fptoui float %95 to i8
  %99 = fptoui float %96 to i8
  br label %100

100:                                              ; preds = %93, %33
  %101 = phi i8 [ 0, %33 ], [ %98, %93 ]
  %102 = phi i8 [ 0, %33 ], [ %99, %93 ]
  %103 = phi i8 [ 0, %33 ], [ %97, %93 ]
  %104 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %1, i64 %28, i32 0
  store i8 %103, i8 addrspace(1)* %104, align 1, !tbaa !15
  %105 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %1, i64 %28, i32 1
  store i8 %101, i8 addrspace(1)* %105, align 1, !tbaa !17
  %106 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %1, i64 %28, i32 2
  store i8 %102, i8 addrspace(1)* %106, align 1, !tbaa !18
  br label %195

107:                                              ; preds = %174, %43
  %108 = phi float [ 0.000000e+00, %43 ], [ %185, %174 ]
  %109 = phi float [ 0.000000e+00, %43 ], [ %191, %174 ]
  %110 = phi float [ 0.000000e+00, %43 ], [ %188, %174 ]
  %111 = phi i32 [ 0, %43 ], [ %192, %174 ]
  %112 = phi i32 [ 0, %43 ], [ %193, %174 ]
  %113 = zext i32 %111 to i64
  %114 = add i32 %38, %111
  %115 = icmp slt i32 %114, %2
  br i1 %115, label %116, label %134

116:                                              ; preds = %107
  %117 = or i32 %114, %24
  %118 = icmp sgt i32 %117, -1
  %119 = select i1 %39, i1 %118, i1 false
  br i1 %119, label %120, label %134

120:                                              ; preds = %116
  %121 = add nsw i32 %114, %40
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %122, i32 0
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %125 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %122, i32 1
  %126 = load i8, i8 addrspace(1)* %125, align 1, !tbaa.struct !11, !amdgpu.noclobber !5
  %127 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %122, i32 2
  %128 = load i8, i8 addrspace(1)* %127, align 1, !tbaa.struct !12, !amdgpu.noclobber !5
  %129 = zext i8 %128 to i32
  %130 = shl nuw nsw i32 %129, 16
  %131 = zext i8 %126 to i32
  %132 = shl nuw nsw i32 %131, 8
  %133 = zext i8 %124 to i32
  br label %134

134:                                              ; preds = %107, %116, %120
  %135 = phi i32 [ %133, %120 ], [ 0, %116 ], [ 0, %107 ]
  %136 = phi i32 [ %132, %120 ], [ 0, %116 ], [ 0, %107 ]
  %137 = phi i32 [ %130, %120 ], [ 0, %116 ], [ 0, %107 ]
  %138 = or i32 %137, %136
  %139 = lshr exact i32 %136, 8
  %140 = lshr i32 %138, 16
  %141 = sitofp i32 %135 to float
  %142 = getelementptr inbounds float, float addrspace(1)* %4, i64 %113
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !13, !amdgpu.noclobber !5
  %144 = fmul contract float %143, %141
  %145 = fadd contract float %108, %144
  %146 = sitofp i32 %139 to float
  %147 = fmul contract float %143, %146
  %148 = fadd contract float %110, %147
  %149 = sitofp i32 %140 to float
  %150 = fmul contract float %143, %149
  %151 = fadd contract float %109, %150
  %152 = or i32 %111, 1
  %153 = zext i32 %152 to i64
  %154 = add i32 %38, %152
  %155 = icmp slt i32 %154, %2
  br i1 %155, label %156, label %174

156:                                              ; preds = %134
  %157 = or i32 %154, %24
  %158 = icmp sgt i32 %157, -1
  %159 = select i1 %39, i1 %158, i1 false
  br i1 %159, label %160, label %174

160:                                              ; preds = %156
  %161 = add nsw i32 %154, %40
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %162, i32 0
  %164 = load i8, i8 addrspace(1)* %163, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %165 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %162, i32 1
  %166 = load i8, i8 addrspace(1)* %165, align 1, !tbaa.struct !11, !amdgpu.noclobber !5
  %167 = getelementptr inbounds %struct.pixel, %struct.pixel addrspace(1)* %0, i64 %162, i32 2
  %168 = load i8, i8 addrspace(1)* %167, align 1, !tbaa.struct !12, !amdgpu.noclobber !5
  %169 = zext i8 %168 to i32
  %170 = shl nuw nsw i32 %169, 16
  %171 = zext i8 %166 to i32
  %172 = shl nuw nsw i32 %171, 8
  %173 = zext i8 %164 to i32
  br label %174

174:                                              ; preds = %160, %156, %134
  %175 = phi i32 [ %173, %160 ], [ 0, %156 ], [ 0, %134 ]
  %176 = phi i32 [ %172, %160 ], [ 0, %156 ], [ 0, %134 ]
  %177 = phi i32 [ %170, %160 ], [ 0, %156 ], [ 0, %134 ]
  %178 = or i32 %177, %176
  %179 = lshr exact i32 %176, 8
  %180 = lshr i32 %178, 16
  %181 = sitofp i32 %175 to float
  %182 = getelementptr inbounds float, float addrspace(1)* %4, i64 %153
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !13, !amdgpu.noclobber !5
  %184 = fmul contract float %183, %181
  %185 = fadd contract float %145, %184
  %186 = sitofp i32 %179 to float
  %187 = fmul contract float %183, %186
  %188 = fadd contract float %148, %187
  %189 = sitofp i32 %180 to float
  %190 = fmul contract float %183, %189
  %191 = fadd contract float %151, %190
  %192 = add nuw nsw i32 %111, 2
  %193 = add i32 %112, 2
  %194 = icmp eq i32 %193, %44
  br i1 %194, label %45, label %107, !llvm.loop !19

195:                                              ; preds = %100, %6
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
