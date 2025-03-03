; ModuleID = '../data/hip_kernels/15587/1/main.cu'
source_filename = "../data/hip_kernels/15587/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21kernel_generatePointsP12hiprandStatePii(%struct.hiprandState addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #1 {
  %4 = alloca [20 x i8], align 4, addrspace(5)
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %175

15:                                               ; preds = %3
  %16 = getelementptr inbounds [20 x i8], [20 x i8] addrspace(5)* %4, i32 0, i32 0
  call void @llvm.lifetime.start.p5i8(i64 20, i8 addrspace(5)* %16)
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 0
  %19 = load i32, i32 addrspace(1)* %18, align 8
  %20 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 1
  %21 = bitcast i32 addrspace(1)* %20 to i8 addrspace(1)*
  call void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noundef align 4 dereferenceable(20) %16, i8 addrspace(1)* noundef align 4 dereferenceable(20) %21, i64 20, i1 false)
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 5, i64 0
  %23 = load i32, i32 addrspace(1)* %22, align 8
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 5, i64 1
  %25 = load i32, i32 addrspace(1)* %24, align 4
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 5, i64 2
  %27 = load i32, i32 addrspace(1)* %26, align 8
  %28 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 5, i64 3
  %29 = load i32, i32 addrspace(1)* %28, align 4
  %30 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 5, i64 4
  %31 = load i32, i32 addrspace(1)* %30, align 8
  %32 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 5, i64 5
  %33 = load i32, i32 addrspace(1)* %32, align 4
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  br label %37

35:                                               ; preds = %172
  %36 = add i32 %19, 724874000
  store i32 %36, i32 addrspace(1)* %18, align 8
  call void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(20) %21, i8 addrspace(5)* noundef align 4 dereferenceable(20) %16, i64 20, i1 false)
  store i32 %95, i32 addrspace(1)* %22, align 8
  store i32 %115, i32 addrspace(1)* %24, align 4
  store i32 %127, i32 addrspace(1)* %26, align 8
  store i32 %147, i32 addrspace(1)* %28, align 4
  store i32 %159, i32 addrspace(1)* %30, align 8
  store i32 %33, i32 addrspace(1)* %32, align 4
  call void @llvm.lifetime.end.p5i8(i64 20, i8 addrspace(5)* %16)
  br label %175

37:                                               ; preds = %172, %15
  %38 = phi i32 [ 0, %15 ], [ %173, %172 ]
  %39 = phi i32 [ %19, %15 ], [ %160, %172 ]
  %40 = phi i32 [ %23, %15 ], [ %95, %172 ]
  %41 = phi i32 [ %25, %15 ], [ %115, %172 ]
  %42 = phi i32 [ %27, %15 ], [ %127, %172 ]
  %43 = phi i32 [ %29, %15 ], [ %147, %172 ]
  %44 = phi i32 [ %31, %15 ], [ %159, %172 ]
  %45 = lshr i32 %40, 2
  %46 = xor i32 %45, %40
  %47 = shl i32 %44, 4
  %48 = shl i32 %46, 1
  %49 = xor i32 %47, %48
  %50 = xor i32 %49, %44
  %51 = xor i32 %50, %46
  %52 = add i32 %39, 362437
  %53 = add i32 %52, %51
  %54 = uitofp i32 %53 to float
  %55 = fmul contract float %54, 0x3DF0000000000000
  %56 = fadd contract float %55, 0x3DF0000000000000
  %57 = lshr i32 %41, 2
  %58 = xor i32 %57, %41
  %59 = shl i32 %51, 4
  %60 = shl i32 %58, 1
  %61 = xor i32 %60, %59
  %62 = xor i32 %61, %58
  %63 = xor i32 %62, %51
  %64 = add i32 %39, 724874
  %65 = add i32 %63, %64
  %66 = uitofp i32 %65 to float
  %67 = fmul contract float %66, 0x3DF0000000000000
  %68 = fadd contract float %67, 0x3DF0000000000000
  %69 = fmul contract float %56, %56
  %70 = fmul contract float %68, %68
  %71 = fadd contract float %69, %70
  %72 = fcmp contract ugt float %71, 1.000000e+00
  br i1 %72, label %76, label %73

73:                                               ; preds = %37
  %74 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %75 = add nsw i32 %74, 1
  store i32 %75, i32 addrspace(1)* %34, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %37, %73
  %77 = lshr i32 %42, 2
  %78 = xor i32 %77, %42
  %79 = shl i32 %63, 4
  %80 = shl i32 %78, 1
  %81 = xor i32 %79, %80
  %82 = xor i32 %81, %63
  %83 = xor i32 %82, %78
  %84 = add i32 %39, 1087311
  %85 = add i32 %84, %83
  %86 = uitofp i32 %85 to float
  %87 = fmul contract float %86, 0x3DF0000000000000
  %88 = fadd contract float %87, 0x3DF0000000000000
  %89 = lshr i32 %43, 2
  %90 = xor i32 %89, %43
  %91 = shl i32 %83, 4
  %92 = shl i32 %90, 1
  %93 = xor i32 %92, %91
  %94 = xor i32 %93, %90
  %95 = xor i32 %94, %83
  %96 = add i32 %39, 1449748
  %97 = add i32 %95, %96
  %98 = uitofp i32 %97 to float
  %99 = fmul contract float %98, 0x3DF0000000000000
  %100 = fadd contract float %99, 0x3DF0000000000000
  %101 = fmul contract float %88, %88
  %102 = fmul contract float %100, %100
  %103 = fadd contract float %101, %102
  %104 = fcmp contract ugt float %103, 1.000000e+00
  br i1 %104, label %108, label %105

105:                                              ; preds = %76
  %106 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %107 = add nsw i32 %106, 1
  store i32 %107, i32 addrspace(1)* %34, align 4, !tbaa !7
  br label %108

108:                                              ; preds = %105, %76
  %109 = lshr i32 %44, 2
  %110 = xor i32 %109, %44
  %111 = shl i32 %95, 4
  %112 = shl i32 %110, 1
  %113 = xor i32 %111, %112
  %114 = xor i32 %113, %95
  %115 = xor i32 %114, %110
  %116 = add i32 %39, 1812185
  %117 = add i32 %116, %115
  %118 = uitofp i32 %117 to float
  %119 = fmul contract float %118, 0x3DF0000000000000
  %120 = fadd contract float %119, 0x3DF0000000000000
  %121 = lshr i32 %51, 2
  %122 = xor i32 %121, %51
  %123 = shl i32 %115, 4
  %124 = shl i32 %122, 1
  %125 = xor i32 %124, %123
  %126 = xor i32 %125, %122
  %127 = xor i32 %126, %115
  %128 = add i32 %39, 2174622
  %129 = add i32 %127, %128
  %130 = uitofp i32 %129 to float
  %131 = fmul contract float %130, 0x3DF0000000000000
  %132 = fadd contract float %131, 0x3DF0000000000000
  %133 = fmul contract float %120, %120
  %134 = fmul contract float %132, %132
  %135 = fadd contract float %133, %134
  %136 = fcmp contract ugt float %135, 1.000000e+00
  br i1 %136, label %140, label %137

137:                                              ; preds = %108
  %138 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %139 = add nsw i32 %138, 1
  store i32 %139, i32 addrspace(1)* %34, align 4, !tbaa !7
  br label %140

140:                                              ; preds = %137, %108
  %141 = lshr i32 %63, 2
  %142 = xor i32 %141, %63
  %143 = shl i32 %127, 4
  %144 = shl i32 %142, 1
  %145 = xor i32 %143, %144
  %146 = xor i32 %145, %127
  %147 = xor i32 %146, %142
  %148 = add i32 %39, 2537059
  %149 = add i32 %148, %147
  %150 = uitofp i32 %149 to float
  %151 = fmul contract float %150, 0x3DF0000000000000
  %152 = fadd contract float %151, 0x3DF0000000000000
  %153 = lshr i32 %83, 2
  %154 = xor i32 %153, %83
  %155 = shl i32 %147, 4
  %156 = shl i32 %154, 1
  %157 = xor i32 %156, %155
  %158 = xor i32 %157, %154
  %159 = xor i32 %158, %147
  %160 = add i32 %39, 2899496
  %161 = add i32 %159, %160
  %162 = uitofp i32 %161 to float
  %163 = fmul contract float %162, 0x3DF0000000000000
  %164 = fadd contract float %163, 0x3DF0000000000000
  %165 = fmul contract float %152, %152
  %166 = fmul contract float %164, %164
  %167 = fadd contract float %165, %166
  %168 = fcmp contract ugt float %167, 1.000000e+00
  br i1 %168, label %172, label %169

169:                                              ; preds = %140
  %170 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %171 = add nsw i32 %170, 1
  store i32 %171, i32 addrspace(1)* %34, align 4, !tbaa !7
  br label %172

172:                                              ; preds = %169, %140
  %173 = add nuw nsw i32 %38, 4
  %174 = icmp eq i32 %173, 1000
  br i1 %174, label %35, label %37, !llvm.loop !11

175:                                              ; preds = %3, %35
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(5)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

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
