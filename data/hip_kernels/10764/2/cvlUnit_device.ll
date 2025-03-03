; ModuleID = '../data/hip_kernels/10764/2/main.cu'
source_filename = "../data/hip_kernels/10764/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7cvlUnitPKcS0_S0_S0_PcS1_S1_iii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture writeonly %5, i8 addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = mul nsw i32 %27, %7
  %29 = add nsw i32 %28, %19
  %30 = icmp slt i32 %19, %7
  %31 = icmp slt i32 %27, %8
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %192

33:                                               ; preds = %10
  %34 = sdiv i32 %9, 2
  %35 = sub nsw i32 %19, %34
  %36 = icmp sgt i32 %35, -1
  %37 = add nsw i32 %19, %34
  %38 = icmp slt i32 %37, %7
  %39 = select i1 %36, i1 %38, i1 false
  br i1 %39, label %40, label %53

40:                                               ; preds = %33
  %41 = sub nsw i32 %27, %34
  %42 = icmp sgt i32 %41, -1
  %43 = add nsw i32 %27, %34
  %44 = icmp slt i32 %43, %8
  %45 = select i1 %42, i1 %44, i1 false
  br i1 %45, label %46, label %53

46:                                               ; preds = %40
  %47 = icmp sgt i32 %9, 0
  br i1 %47, label %48, label %173

48:                                               ; preds = %46
  %49 = and i32 %9, 1
  %50 = icmp eq i32 %9, 1
  %51 = and i32 %9, -2
  %52 = icmp eq i32 %49, 0
  br label %63

53:                                               ; preds = %40, %33
  %54 = sext i32 %29 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7, !amdgpu.noclobber !5
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %54
  store i8 %56, i8 addrspace(1)* %57, align 1, !tbaa !7
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %54
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %54
  store i8 %59, i8 addrspace(1)* %60, align 1, !tbaa !7
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %54
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !7
  br label %188

63:                                               ; preds = %48, %163
  %64 = phi i32 [ %166, %163 ], [ 0, %48 ]
  %65 = phi i32 [ %165, %163 ], [ 0, %48 ]
  %66 = phi i32 [ %164, %163 ], [ 0, %48 ]
  %67 = phi i32 [ %167, %163 ], [ 0, %48 ]
  %68 = add nsw i32 %67, %35
  br i1 %50, label %129, label %69

69:                                               ; preds = %63, %69
  %70 = phi i32 [ %125, %69 ], [ %64, %63 ]
  %71 = phi i32 [ %120, %69 ], [ %65, %63 ]
  %72 = phi i32 [ %115, %69 ], [ %66, %63 ]
  %73 = phi i32 [ %126, %69 ], [ 0, %63 ]
  %74 = phi i32 [ %127, %69 ], [ 0, %63 ]
  %75 = add nsw i32 %73, %41
  %76 = mul nsw i32 %75, %7
  %77 = add nsw i32 %68, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !7, !amdgpu.noclobber !5
  %81 = sext i8 %80 to i32
  %82 = mul nsw i32 %73, %9
  %83 = add nsw i32 %82, %67
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7, !amdgpu.noclobber !5
  %87 = sext i8 %86 to i32
  %88 = mul nsw i32 %87, %81
  %89 = add nsw i32 %88, %72
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %78
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !7, !amdgpu.noclobber !5
  %92 = sext i8 %91 to i32
  %93 = mul nsw i32 %92, %87
  %94 = add nsw i32 %93, %71
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %78
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !7, !amdgpu.noclobber !5
  %97 = sext i8 %96 to i32
  %98 = mul nsw i32 %97, %87
  %99 = add nsw i32 %98, %70
  %100 = or i32 %73, 1
  %101 = add nsw i32 %100, %41
  %102 = mul nsw i32 %101, %7
  %103 = add nsw i32 %68, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %104
  %106 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !7, !amdgpu.noclobber !5
  %107 = sext i8 %106 to i32
  %108 = mul nsw i32 %100, %9
  %109 = add nsw i32 %108, %67
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %110
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !7, !amdgpu.noclobber !5
  %113 = sext i8 %112 to i32
  %114 = mul nsw i32 %113, %107
  %115 = add nsw i32 %114, %89
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %104
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !7, !amdgpu.noclobber !5
  %118 = sext i8 %117 to i32
  %119 = mul nsw i32 %118, %113
  %120 = add nsw i32 %119, %94
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %104
  %122 = load i8, i8 addrspace(1)* %121, align 1, !tbaa !7, !amdgpu.noclobber !5
  %123 = sext i8 %122 to i32
  %124 = mul nsw i32 %123, %113
  %125 = add nsw i32 %124, %99
  %126 = add nuw nsw i32 %73, 2
  %127 = add i32 %74, 2
  %128 = icmp eq i32 %127, %51
  br i1 %128, label %129, label %69, !llvm.loop !10

129:                                              ; preds = %69, %63
  %130 = phi i32 [ undef, %63 ], [ %115, %69 ]
  %131 = phi i32 [ undef, %63 ], [ %120, %69 ]
  %132 = phi i32 [ undef, %63 ], [ %125, %69 ]
  %133 = phi i32 [ %64, %63 ], [ %125, %69 ]
  %134 = phi i32 [ %65, %63 ], [ %120, %69 ]
  %135 = phi i32 [ %66, %63 ], [ %115, %69 ]
  %136 = phi i32 [ 0, %63 ], [ %126, %69 ]
  br i1 %52, label %163, label %137

137:                                              ; preds = %129
  %138 = add nsw i32 %136, %41
  %139 = mul nsw i32 %138, %7
  %140 = add nsw i32 %68, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %141
  %143 = load i8, i8 addrspace(1)* %142, align 1, !tbaa !7, !amdgpu.noclobber !5
  %144 = sext i8 %143 to i32
  %145 = mul nsw i32 %136, %9
  %146 = add nsw i32 %145, %67
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %147
  %149 = load i8, i8 addrspace(1)* %148, align 1, !tbaa !7, !amdgpu.noclobber !5
  %150 = sext i8 %149 to i32
  %151 = mul nsw i32 %150, %144
  %152 = add nsw i32 %151, %135
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %141
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !7, !amdgpu.noclobber !5
  %155 = sext i8 %154 to i32
  %156 = mul nsw i32 %155, %150
  %157 = add nsw i32 %156, %134
  %158 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %141
  %159 = load i8, i8 addrspace(1)* %158, align 1, !tbaa !7, !amdgpu.noclobber !5
  %160 = sext i8 %159 to i32
  %161 = mul nsw i32 %160, %150
  %162 = add nsw i32 %161, %133
  br label %163

163:                                              ; preds = %129, %137
  %164 = phi i32 [ %130, %129 ], [ %152, %137 ]
  %165 = phi i32 [ %131, %129 ], [ %157, %137 ]
  %166 = phi i32 [ %132, %129 ], [ %162, %137 ]
  %167 = add nuw nsw i32 %67, 1
  %168 = icmp eq i32 %167, %9
  br i1 %168, label %169, label %63, !llvm.loop !12

169:                                              ; preds = %163
  %170 = sitofp i32 %164 to double
  %171 = sitofp i32 %165 to double
  %172 = sitofp i32 %166 to double
  br label %173

173:                                              ; preds = %169, %46
  %174 = phi double [ 0.000000e+00, %46 ], [ %170, %169 ]
  %175 = phi double [ 0.000000e+00, %46 ], [ %171, %169 ]
  %176 = phi double [ 0.000000e+00, %46 ], [ %172, %169 ]
  %177 = mul nsw i32 %9, %9
  %178 = sitofp i32 %177 to double
  %179 = fdiv contract double %174, %178
  %180 = fptosi double %179 to i8
  %181 = sext i32 %29 to i64
  %182 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %181
  store i8 %180, i8 addrspace(1)* %182, align 1, !tbaa !7
  %183 = fdiv contract double %175, %178
  %184 = fptosi double %183 to i8
  %185 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %181
  store i8 %184, i8 addrspace(1)* %185, align 1, !tbaa !7
  %186 = fdiv contract double %176, %178
  %187 = fptosi double %186 to i8
  br label %188

188:                                              ; preds = %53, %173
  %189 = phi i64 [ %181, %173 ], [ %54, %53 ]
  %190 = phi i8 [ %187, %173 ], [ %62, %53 ]
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %189
  store i8 %190, i8 addrspace(1)* %191, align 1, !tbaa !7
  br label %192

192:                                              ; preds = %188, %10
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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
