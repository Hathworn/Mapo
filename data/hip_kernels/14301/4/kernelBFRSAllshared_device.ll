; ModuleID = '../data/hip_kernels/14301/4/main.cu'
source_filename = "../data/hip_kernels/14301/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@array = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19kernelBFRSAllsharedPKfS0_PiiiiiS0_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = freeze i32 %17
  %19 = icmp ult i32 %18, %5
  br i1 %19, label %20, label %193

20:                                               ; preds = %8
  %21 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to i32 addrspace(3)*), i32 %9
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = zext i32 %18 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %7, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !11, !amdgpu.noclobber !6
  %25 = urem i32 %18, %4
  %26 = sub nuw i32 %18, %25
  %27 = icmp sgt i32 %4, 0
  br i1 %27, label %28, label %38

28:                                               ; preds = %20
  %29 = sub i32 %25, %6
  %30 = add i32 %25, %6
  %31 = sext i32 %18 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = icmp sgt i32 %3, 0
  %34 = and i32 %3, 7
  %35 = icmp ult i32 %3, 8
  %36 = and i32 %3, -8
  %37 = icmp eq i32 %34, 0
  br label %41

38:                                               ; preds = %190, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %22
  store i32 %39, i32 addrspace(1)* %40, align 4, !tbaa !7
  br label %193

41:                                               ; preds = %28, %190
  %42 = phi i32 [ 0, %28 ], [ %191, %190 ]
  %43 = icmp slt i32 %42, %29
  %44 = icmp sgt i32 %42, %30
  %45 = or i1 %43, %44
  br i1 %45, label %46, label %190

46:                                               ; preds = %41
  %47 = add i32 %26, %42
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  br i1 %33, label %50, label %184

50:                                               ; preds = %46
  br i1 %35, label %161, label %51

51:                                               ; preds = %50, %51
  %52 = phi i32 [ %158, %51 ], [ 0, %50 ]
  %53 = phi float [ %157, %51 ], [ 0.000000e+00, %50 ]
  %54 = phi i32 [ %159, %51 ], [ 0, %50 ]
  %55 = mul nsw i32 %52, %5
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %32, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !11, !amdgpu.noclobber !6
  %59 = getelementptr inbounds float, float addrspace(1)* %49, i64 %56
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11, !amdgpu.noclobber !6
  %61 = fsub contract float %60, %58
  %62 = fcmp contract olt float %61, 0.000000e+00
  %63 = fneg contract float %61
  %64 = select contract i1 %62, float %63, float %61
  %65 = fcmp contract olt float %53, %64
  %66 = select contract i1 %65, float %64, float %53
  %67 = or i32 %52, 1
  %68 = mul nsw i32 %67, %5
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %32, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !11, !amdgpu.noclobber !6
  %72 = getelementptr inbounds float, float addrspace(1)* %49, i64 %69
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11, !amdgpu.noclobber !6
  %74 = fsub contract float %73, %71
  %75 = fcmp contract olt float %74, 0.000000e+00
  %76 = fneg contract float %74
  %77 = select contract i1 %75, float %76, float %74
  %78 = fcmp contract olt float %66, %77
  %79 = select contract i1 %78, float %77, float %66
  %80 = or i32 %52, 2
  %81 = mul nsw i32 %80, %5
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %32, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !11, !amdgpu.noclobber !6
  %85 = getelementptr inbounds float, float addrspace(1)* %49, i64 %82
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11, !amdgpu.noclobber !6
  %87 = fsub contract float %86, %84
  %88 = fcmp contract olt float %87, 0.000000e+00
  %89 = fneg contract float %87
  %90 = select contract i1 %88, float %89, float %87
  %91 = fcmp contract olt float %79, %90
  %92 = select contract i1 %91, float %90, float %79
  %93 = or i32 %52, 3
  %94 = mul nsw i32 %93, %5
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %32, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11, !amdgpu.noclobber !6
  %98 = getelementptr inbounds float, float addrspace(1)* %49, i64 %95
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !11, !amdgpu.noclobber !6
  %100 = fsub contract float %99, %97
  %101 = fcmp contract olt float %100, 0.000000e+00
  %102 = fneg contract float %100
  %103 = select contract i1 %101, float %102, float %100
  %104 = fcmp contract olt float %92, %103
  %105 = select contract i1 %104, float %103, float %92
  %106 = or i32 %52, 4
  %107 = mul nsw i32 %106, %5
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %32, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !11, !amdgpu.noclobber !6
  %111 = getelementptr inbounds float, float addrspace(1)* %49, i64 %108
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11, !amdgpu.noclobber !6
  %113 = fsub contract float %112, %110
  %114 = fcmp contract olt float %113, 0.000000e+00
  %115 = fneg contract float %113
  %116 = select contract i1 %114, float %115, float %113
  %117 = fcmp contract olt float %105, %116
  %118 = select contract i1 %117, float %116, float %105
  %119 = or i32 %52, 5
  %120 = mul nsw i32 %119, %5
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %32, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11, !amdgpu.noclobber !6
  %124 = getelementptr inbounds float, float addrspace(1)* %49, i64 %121
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !11, !amdgpu.noclobber !6
  %126 = fsub contract float %125, %123
  %127 = fcmp contract olt float %126, 0.000000e+00
  %128 = fneg contract float %126
  %129 = select contract i1 %127, float %128, float %126
  %130 = fcmp contract olt float %118, %129
  %131 = select contract i1 %130, float %129, float %118
  %132 = or i32 %52, 6
  %133 = mul nsw i32 %132, %5
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %32, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !11, !amdgpu.noclobber !6
  %137 = getelementptr inbounds float, float addrspace(1)* %49, i64 %134
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !11, !amdgpu.noclobber !6
  %139 = fsub contract float %138, %136
  %140 = fcmp contract olt float %139, 0.000000e+00
  %141 = fneg contract float %139
  %142 = select contract i1 %140, float %141, float %139
  %143 = fcmp contract olt float %131, %142
  %144 = select contract i1 %143, float %142, float %131
  %145 = or i32 %52, 7
  %146 = mul nsw i32 %145, %5
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %32, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !11, !amdgpu.noclobber !6
  %150 = getelementptr inbounds float, float addrspace(1)* %49, i64 %147
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !11, !amdgpu.noclobber !6
  %152 = fsub contract float %151, %149
  %153 = fcmp contract olt float %152, 0.000000e+00
  %154 = fneg contract float %152
  %155 = select contract i1 %153, float %154, float %152
  %156 = fcmp contract olt float %144, %155
  %157 = select contract i1 %156, float %155, float %144
  %158 = add nuw nsw i32 %52, 8
  %159 = add i32 %54, 8
  %160 = icmp eq i32 %159, %36
  br i1 %160, label %161, label %51, !llvm.loop !13

161:                                              ; preds = %51, %50
  %162 = phi float [ undef, %50 ], [ %157, %51 ]
  %163 = phi i32 [ 0, %50 ], [ %158, %51 ]
  %164 = phi float [ 0.000000e+00, %50 ], [ %157, %51 ]
  br i1 %37, label %184, label %165

165:                                              ; preds = %161, %165
  %166 = phi i32 [ %181, %165 ], [ %163, %161 ]
  %167 = phi float [ %180, %165 ], [ %164, %161 ]
  %168 = phi i32 [ %182, %165 ], [ 0, %161 ]
  %169 = mul nsw i32 %166, %5
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %32, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !11, !amdgpu.noclobber !6
  %173 = getelementptr inbounds float, float addrspace(1)* %49, i64 %170
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !11, !amdgpu.noclobber !6
  %175 = fsub contract float %174, %172
  %176 = fcmp contract olt float %175, 0.000000e+00
  %177 = fneg contract float %175
  %178 = select contract i1 %176, float %177, float %175
  %179 = fcmp contract olt float %167, %178
  %180 = select contract i1 %179, float %178, float %167
  %181 = add nuw nsw i32 %166, 1
  %182 = add i32 %168, 1
  %183 = icmp eq i32 %182, %34
  br i1 %183, label %184, label %165, !llvm.loop !15

184:                                              ; preds = %161, %165, %46
  %185 = phi float [ 0.000000e+00, %46 ], [ %162, %161 ], [ %180, %165 ]
  %186 = fcmp contract ugt float %185, %24
  br i1 %186, label %190, label %187

187:                                              ; preds = %184
  %188 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %189 = add nsw i32 %188, 1
  store i32 %189, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %190

190:                                              ; preds = %184, %187, %41
  %191 = add nuw nsw i32 %42, 1
  %192 = icmp eq i32 %191, %4
  br i1 %192, label %38, label %41, !llvm.loop !17

193:                                              ; preds = %38, %8
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
