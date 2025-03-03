; ModuleID = '../data/hip_kernels/6394/11/main.cu'
source_filename = "../data/hip_kernels/6394/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12gpuCrossoverPiP12hiprandStateiiif(i32 addrspace(1)* nocapture %0, %struct.hiprandState addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 0
  %17 = load i32, i32 addrspace(1)* %16, align 8, !amdgpu.noclobber !5
  %18 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 0
  %19 = load i32, i32 addrspace(1)* %18, align 8, !amdgpu.noclobber !5
  %20 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 1
  %21 = load i32, i32 addrspace(1)* %20, align 4, !amdgpu.noclobber !5
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 2
  %23 = load i32, i32 addrspace(1)* %22, align 8, !amdgpu.noclobber !5
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 3
  %25 = load i32, i32 addrspace(1)* %24, align 4, !amdgpu.noclobber !5
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 4
  %27 = load i32, i32 addrspace(1)* %26, align 8, !amdgpu.noclobber !5
  %28 = lshr i32 %19, 2
  %29 = xor i32 %28, %19
  %30 = shl i32 %27, 4
  %31 = shl i32 %29, 1
  %32 = xor i32 %31, %30
  %33 = xor i32 %32, %29
  %34 = xor i32 %33, %27
  %35 = add i32 %17, 362437
  store i32 %35, i32 addrspace(1)* %16, align 8
  store i32 %21, i32 addrspace(1)* %18, align 8
  store i32 %23, i32 addrspace(1)* %20, align 4
  store i32 %25, i32 addrspace(1)* %22, align 8
  store i32 %27, i32 addrspace(1)* %24, align 4
  store i32 %34, i32 addrspace(1)* %26, align 8
  %36 = sitofp i32 %2 to float
  %37 = shl nsw i32 %15, 1
  %38 = mul nsw i32 %37, %2
  %39 = add nsw i32 %38, %2
  %40 = add nsw i32 %39, %2
  %41 = mul nsw i32 %3, %2
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %72

43:                                               ; preds = %6
  %44 = add i32 %34, %35
  %45 = uitofp i32 %44 to float
  %46 = fmul contract float %45, 0x3DF0000000000000
  %47 = fadd contract float %46, 0x3DF0000000000000
  %48 = fmul contract float %47, %36
  %49 = fptosi float %48 to i32
  %50 = icmp slt i32 %49, %2
  br i1 %50, label %51, label %72

51:                                               ; preds = %43
  %52 = add nsw i32 %38, %49
  %53 = add nsw i32 %39, %49
  %54 = sext i32 %52 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = sext i32 %53 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %59, %51
  %60 = phi i32 [ %58, %51 ], [ %62, %59 ]
  %61 = phi i32 [ %49, %51 ], [ %63, %59 ]
  %62 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  store i32 %60, i32 addrspace(1)* %55, align 4, !tbaa !7
  store i32 %62, i32 addrspace(1)* %57, align 4, !tbaa !7
  %63 = add nsw i32 %61, 1
  %64 = icmp slt i32 %63, %2
  br i1 %64, label %59, label %65, !llvm.loop !11

65:                                               ; preds = %59
  %66 = load i32, i32 addrspace(1)* %16, align 8
  %67 = load i32, i32 addrspace(1)* %18, align 8
  %68 = load i32, i32 addrspace(1)* %20, align 4
  %69 = load i32, i32 addrspace(1)* %22, align 8
  %70 = load i32, i32 addrspace(1)* %24, align 4
  %71 = load i32, i32 addrspace(1)* %26, align 8
  br label %72

72:                                               ; preds = %65, %43, %6
  %73 = phi i32 [ %71, %65 ], [ %34, %43 ], [ %34, %6 ]
  %74 = phi i32 [ %70, %65 ], [ %27, %43 ], [ %27, %6 ]
  %75 = phi i32 [ %69, %65 ], [ %25, %43 ], [ %25, %6 ]
  %76 = phi i32 [ %68, %65 ], [ %23, %43 ], [ %23, %6 ]
  %77 = phi i32 [ %67, %65 ], [ %21, %43 ], [ %21, %6 ]
  %78 = phi i32 [ %66, %65 ], [ %35, %43 ], [ %35, %6 ]
  %79 = lshr i32 %77, 2
  %80 = xor i32 %79, %77
  %81 = shl i32 %73, 4
  %82 = shl i32 %80, 1
  %83 = xor i32 %82, %81
  %84 = xor i32 %83, %80
  %85 = xor i32 %84, %73
  %86 = add i32 %78, 362437
  %87 = add i32 %85, %86
  %88 = uitofp i32 %87 to float
  %89 = fmul contract float %88, 0x3DF0000000000000
  %90 = fadd contract float %89, 0x3DF0000000000000
  store i32 %86, i32 addrspace(1)* %16, align 8
  store i32 %76, i32 addrspace(1)* %18, align 8
  store i32 %75, i32 addrspace(1)* %20, align 4
  store i32 %74, i32 addrspace(1)* %22, align 8
  store i32 %73, i32 addrspace(1)* %24, align 4
  store i32 %85, i32 addrspace(1)* %26, align 8
  %91 = fmul contract float %90, 1.000000e+02
  %92 = fptosi float %91 to i32
  %93 = sitofp i32 %92 to float
  %94 = fmul contract float %5, 1.000000e+02
  %95 = fcmp contract ogt float %94, %93
  br i1 %95, label %96, label %201

96:                                               ; preds = %72
  %97 = lshr i32 %76, 2
  %98 = xor i32 %97, %76
  %99 = shl i32 %85, 4
  %100 = shl i32 %98, 1
  %101 = xor i32 %100, %99
  %102 = xor i32 %101, %98
  %103 = xor i32 %102, %85
  %104 = add i32 %78, 724874
  %105 = add i32 %103, %104
  %106 = uitofp i32 %105 to float
  %107 = fmul contract float %106, 0x3DF0000000000000
  %108 = fadd contract float %107, 0x3DF0000000000000
  store i32 %104, i32 addrspace(1)* %16, align 8
  store i32 %75, i32 addrspace(1)* %18, align 8
  store i32 %74, i32 addrspace(1)* %20, align 4
  store i32 %73, i32 addrspace(1)* %22, align 8
  store i32 %85, i32 addrspace(1)* %24, align 4
  store i32 %103, i32 addrspace(1)* %26, align 8
  %109 = sdiv i32 %2, 4
  %110 = sitofp i32 %109 to float
  %111 = fmul contract float %108, %110
  %112 = fptosi float %111 to i32
  %113 = icmp sgt i32 %112, 0
  br i1 %113, label %114, label %201

114:                                              ; preds = %96
  %115 = and i32 %112, 1
  %116 = icmp eq i32 %112, 1
  br i1 %116, label %173, label %117

117:                                              ; preds = %114
  %118 = and i32 %112, -2
  br label %119

119:                                              ; preds = %119, %117
  %120 = phi i32 [ 0, %117 ], [ %171, %119 ]
  %121 = load i32, i32 addrspace(1)* %16, align 8
  %122 = load i32, i32 addrspace(1)* %18, align 8
  %123 = load i32, i32 addrspace(1)* %20, align 4
  %124 = load i32, i32 addrspace(1)* %22, align 8
  %125 = load i32, i32 addrspace(1)* %24, align 4
  %126 = load i32, i32 addrspace(1)* %26, align 8
  %127 = lshr i32 %122, 2
  %128 = xor i32 %127, %122
  %129 = shl i32 %126, 4
  %130 = shl i32 %128, 1
  %131 = xor i32 %130, %129
  %132 = xor i32 %131, %128
  %133 = xor i32 %132, %126
  %134 = add i32 %121, 362437
  %135 = add i32 %133, %134
  %136 = uitofp i32 %135 to float
  %137 = fmul contract float %136, 0x3DF0000000000000
  %138 = fadd contract float %137, 0x3DF0000000000000
  store i32 %134, i32 addrspace(1)* %16, align 8
  store i32 %123, i32 addrspace(1)* %18, align 8
  store i32 %124, i32 addrspace(1)* %20, align 4
  store i32 %125, i32 addrspace(1)* %22, align 8
  store i32 %126, i32 addrspace(1)* %24, align 4
  store i32 %133, i32 addrspace(1)* %26, align 8
  %139 = fmul contract float %138, %36
  %140 = fptosi float %139 to i32
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !7
  %144 = icmp ne i32 %143, 1
  %145 = zext i1 %144 to i32
  store i32 %145, i32 addrspace(1)* %142, align 4, !tbaa !7
  %146 = load i32, i32 addrspace(1)* %16, align 8
  %147 = load i32, i32 addrspace(1)* %18, align 8
  %148 = load i32, i32 addrspace(1)* %20, align 4
  %149 = load i32, i32 addrspace(1)* %22, align 8
  %150 = load i32, i32 addrspace(1)* %24, align 4
  %151 = load i32, i32 addrspace(1)* %26, align 8
  %152 = lshr i32 %147, 2
  %153 = xor i32 %152, %147
  %154 = shl i32 %151, 4
  %155 = shl i32 %153, 1
  %156 = xor i32 %155, %154
  %157 = xor i32 %156, %153
  %158 = xor i32 %157, %151
  %159 = add i32 %146, 362437
  %160 = add i32 %158, %159
  %161 = uitofp i32 %160 to float
  %162 = fmul contract float %161, 0x3DF0000000000000
  %163 = fadd contract float %162, 0x3DF0000000000000
  store i32 %159, i32 addrspace(1)* %16, align 8
  store i32 %148, i32 addrspace(1)* %18, align 8
  store i32 %149, i32 addrspace(1)* %20, align 4
  store i32 %150, i32 addrspace(1)* %22, align 8
  store i32 %151, i32 addrspace(1)* %24, align 4
  store i32 %158, i32 addrspace(1)* %26, align 8
  %164 = fmul contract float %163, %36
  %165 = fptosi float %164 to i32
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !7
  %169 = icmp ne i32 %168, 1
  %170 = zext i1 %169 to i32
  store i32 %170, i32 addrspace(1)* %167, align 4, !tbaa !7
  %171 = add i32 %120, 2
  %172 = icmp eq i32 %171, %118
  br i1 %172, label %173, label %119, !llvm.loop !13

173:                                              ; preds = %119, %114
  %174 = icmp eq i32 %115, 0
  br i1 %174, label %201, label %175

175:                                              ; preds = %173
  %176 = load i32, i32 addrspace(1)* %16, align 8
  %177 = load i32, i32 addrspace(1)* %18, align 8
  %178 = load i32, i32 addrspace(1)* %20, align 4
  %179 = load i32, i32 addrspace(1)* %22, align 8
  %180 = load i32, i32 addrspace(1)* %24, align 4
  %181 = load i32, i32 addrspace(1)* %26, align 8
  %182 = lshr i32 %177, 2
  %183 = xor i32 %182, %177
  %184 = shl i32 %181, 4
  %185 = shl i32 %183, 1
  %186 = xor i32 %185, %184
  %187 = xor i32 %186, %183
  %188 = xor i32 %187, %181
  %189 = add i32 %176, 362437
  %190 = add i32 %188, %189
  %191 = uitofp i32 %190 to float
  %192 = fmul contract float %191, 0x3DF0000000000000
  %193 = fadd contract float %192, 0x3DF0000000000000
  store i32 %189, i32 addrspace(1)* %16, align 8
  store i32 %178, i32 addrspace(1)* %18, align 8
  store i32 %179, i32 addrspace(1)* %20, align 4
  store i32 %180, i32 addrspace(1)* %22, align 8
  store i32 %181, i32 addrspace(1)* %24, align 4
  store i32 %188, i32 addrspace(1)* %26, align 8
  %194 = fmul contract float %193, %36
  %195 = fptosi float %194 to i32
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %196
  %198 = load i32, i32 addrspace(1)* %197, align 4, !tbaa !7
  %199 = icmp ne i32 %198, 1
  %200 = zext i1 %199 to i32
  store i32 %200, i32 addrspace(1)* %197, align 4, !tbaa !7
  br label %201

201:                                              ; preds = %175, %173, %96, %72
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
